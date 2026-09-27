import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

/// Manages local image storage for receipt photos
class ImageService {
  static const String _receiptFolder = 'receipts';

  /// Save an image file to app documents directory
  /// Returns the persisted file path
  static Future<String> saveReceiptImage(File sourceFile) async {
    final docsDir = await getApplicationDocumentsDirectory();
    final receiptDir = Directory(p.join(docsDir.path, _receiptFolder));
    if (!await receiptDir.exists()) {
      await receiptDir.create(recursive: true);
    }

    final fileName =
        'receipt_${DateTime.now().millisecondsSinceEpoch}${p.extension(sourceFile.path)}';
    final destPath = p.join(receiptDir.path, fileName);
    await sourceFile.copy(destPath);
    return destPath;
  }

  /// Delete a stored receipt image
  static Future<void> deleteReceiptImage(String imagePath) async {
    final file = File(imagePath);
    if (await file.exists()) {
      await file.delete();
    }
  }

  /// Get File from stored path (returns null if not found)
  static Future<File?> getReceiptFile(String? imagePath) async {
    if (imagePath == null) return null;
    final file = File(imagePath);
    return await file.exists() ? file : null;
  }

  /// Get thumbnail-sized image (returns original for now — resize in Stage 2)
  static Future<File?> getThumbnail(String? imagePath) =>
      getReceiptFile(imagePath);
}
