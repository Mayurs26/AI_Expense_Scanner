import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';
import '../../features/expenses/domain/entities/expense_entity.dart';
import '../extensions/date_extensions.dart';
import '../extensions/currency_extensions.dart';

/// CSV export service for expenses
class ExportService {
  /// Generate and share a CSV of the provided expenses
  static Future<void> exportExpensesToCsv(
    List<ExpenseEntity> expenses, {
    required String currencySymbol,
  }) async {
    final csvContent = _buildCsv(expenses, currencySymbol: currencySymbol);

    final tempDir = await getTemporaryDirectory();
    final fileName =
        'expenses_${DateTime.now().millisecondsSinceEpoch}.csv';
    final file = File(p.join(tempDir.path, fileName));
    await file.writeAsString(csvContent);

    await Share.shareXFiles(
      [XFile(file.path, mimeType: 'text/csv')],
      subject: 'AI Expense Scanner — Expense Report',
    );
  }

  static String _buildCsv(
    List<ExpenseEntity> expenses, {
    required String currencySymbol,
  }) {
    final buffer = StringBuffer();

    // Header
    buffer.writeln(
        'Date,Store / Merchant,Category,Amount,GST,Payment Method,Receipt #,Tags,Notes');

    // Rows
    for (final e in expenses) {
      buffer.writeln([
        e.date.isoDate,
        _escape(e.storeName),
        _escape(e.categoryName ?? ''),
        e.totalAmount.formatted(symbol: currencySymbol),
        e.gstAmount?.formatted(symbol: currencySymbol) ?? '',
        _escape(e.paymentMethod ?? ''),
        _escape(e.receiptNumber ?? ''),
        _escape(e.tags ?? ''),
        _escape(e.notes ?? ''),
      ].join(','));
    }

    return buffer.toString();
  }

  static String _escape(String value) {
    if (value.contains(',') || value.contains('"') || value.contains('\n')) {
      return '"${value.replaceAll('"', '""')}"';
    }
    return value;
  }
}
