import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class OcrService {
  final TextRecognizer _textRecognizer = TextRecognizer();

  Future<Map<String, dynamic>> processImage(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final recognizedText = await _textRecognizer.processImage(inputImage);

    return _parseReceiptText(recognizedText.text);
  }

  Map<String, dynamic> _parseReceiptText(String text) {
    final lines = text.split('\n');

    String? storeName;
    String? billNumber;
    DateTime? date;
    String? time;
    String? tableNumber;
    String? waiter;
    double? cgst;
    double? sgst;
    double? grandTotal;

    final List<Map<String, dynamic>> items = [];

    // Regexes
    final amountRegex = RegExp(r'\$?\s*(\d+\.\d{2})');
    final dateRegex = RegExp(r'(\d{1,4}[-/]\d{1,2}[-/]\d{1,4})');
    final timeRegex = RegExp(r'(\d{1,2}:\d{2}\s?(?:AM|PM|am|pm)?)');
    final billNoRegex = RegExp(
      r'(?:bill|invoice|receipt)\s*(?:no|#)?\s*:?\s*([a-zA-Z0-9-]+)',
      caseSensitive: false,
    );
    final tableRegex = RegExp(
      r'table\s*(?:no|#)?\s*:?\s*([a-zA-Z0-9-]+)',
      caseSensitive: false,
    );
    final waiterRegex = RegExp(
      r'(?:waiter|host|server)\s*:?\s*([a-zA-Z]+)',
      caseSensitive: false,
    );
    final taxRegex = RegExp(
      r'(cgst|sgst|igst|tax)\s*(?:@\s*\d+%?)?\s*:?\s*(\d+\.\d{2})',
      caseSensitive: false,
    );
    final totalRegex = RegExp(
      r'(?:grand|net|total|amount due)\s*:?\s*(\d+\.\d{2})',
      caseSensitive: false,
    );

    bool isParsingItems = false;
    String? paymentMethod;

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i].trim();
      if (line.isEmpty) continue;

      final lowerLine = line.toLowerCase();

      // Assume first non-empty line with letters is the store name
      if (storeName == null && line.contains(RegExp(r'[a-zA-Z]'))) {
        storeName = line;
        continue;
      }

      // Bill Number
      if (billNumber == null) {
        final match = billNoRegex.firstMatch(lowerLine);
        if (match != null) {
          billNumber = match.group(1);
        }
      }

      // Date and Time
      if (date == null) {
        final match = dateRegex.firstMatch(line);
        if (match != null) {
          try {
            date = DateTime.tryParse(match.group(1)!);
          } catch (_) {}
        }
      }
      if (time == null) {
        final match = timeRegex.firstMatch(line);
        if (match != null) {
          time = match.group(1);
        }
      }

      // Table & Waiter
      if (tableNumber == null) {
        final match = tableRegex.firstMatch(lowerLine);
        if (match != null) {
          tableNumber = match.group(1);
        }
      }
      if (waiter == null) {
        final match = waiterRegex.firstMatch(lowerLine);
        if (match != null) {
          waiter = match.group(1);
        }
      }

      // Taxes & Totals
      if (taxRegex.hasMatch(lowerLine)) {
        final matches = taxRegex.allMatches(lowerLine);
        for (final match in matches) {
          final type = match.group(1)?.toLowerCase();
          final val = double.tryParse(match.group(2) ?? '');
          if (val != null) {
            if (type == 'cgst') {
              cgst = val;
            }
            if (type == 'sgst') {
              sgst = val;
            }
          }
        }
      }

      final totalMatch = totalRegex.firstMatch(lowerLine);
      if (totalMatch != null) {
        grandTotal = double.tryParse(totalMatch.group(1) ?? '');
      }

      // Payment Method
      if (lowerLine.contains('cash')) {
        paymentMethod = 'Cash';
      } else if (lowerLine.contains('card') ||
          lowerLine.contains('visa') ||
          lowerLine.contains('mastercard')) {
        paymentMethod = 'Card';
      } else if (lowerLine.contains('upi') ||
          lowerLine.contains('gpay') ||
          lowerLine.contains('phonepe')) {
        paymentMethod = 'UPI';
      }

      // Basic item parsing heuristic (text followed by an amount)
      if (lowerLine.contains('qty') || lowerLine.contains('item')) {
        isParsingItems = true;
        continue;
      }
      if (lowerLine.contains('total') ||
          lowerLine.contains('tax') ||
          lowerLine.contains('gst')) {
        isParsingItems = false;
      }

      if (isParsingItems) {
        final amountMatch = amountRegex.firstMatch(line);
        if (amountMatch != null) {
          final price = double.tryParse(amountMatch.group(1) ?? '');
          final name = line.replaceAll(amountRegex, '').trim();
          if (price != null && name.isNotEmpty) {
            items.add({'name': name, 'price': price});
          }
        }
      }
    }

    final double combinedGst = (cgst ?? 0.0) + (sgst ?? 0.0);

    return {
      'storeName': storeName ?? 'Unknown Store',
      'amount': grandTotal ?? 0.0,
      'date': date ?? DateTime.now(),
      'gst': combinedGst > 0 ? combinedGst : null,
      'receiptNumber': billNumber,
      'paymentMethod': paymentMethod,
      'notes': [
        if (time != null) 'Time: $time',
        if (tableNumber != null) 'Table: $tableNumber',
        if (waiter != null) 'Waiter: $waiter',
      ].join(' | '),
      'items': items,
      'rawText': text,
    };
  }

  void dispose() {
    _textRecognizer.close();
  }
}
