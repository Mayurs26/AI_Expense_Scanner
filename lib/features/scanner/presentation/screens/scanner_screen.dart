import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_expense_scanner/core/constants/app_colors.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/expense_entity.dart';
import 'package:ai_expense_scanner/navigation/app_routes.dart';
import 'package:ai_expense_scanner/features/scanner/domain/services/ocr_service.dart';
import 'package:go_router/go_router.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen>
    with SingleTickerProviderStateMixin {
  final ImagePicker _picker = ImagePicker();
  final OcrService _ocrService = OcrService();
  bool _isProcessing = false;
  String _statusMessage = 'Align receipt within frame';

  late final AnimationController _scanAnimCtrl;

  @override
  void initState() {
    super.initState();
    _scanAnimCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _scanAnimCtrl.dispose();
    _ocrService.dispose();
    super.dispose();
  }

  Future<void> _scanReceipt(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 95,
      );
      if (image == null) return;

      setState(() {
        _isProcessing = true;
        _statusMessage = 'Analyzing layout & extracting text…';
      });

      final result = await _ocrService.processImage(image.path);

      if (!mounted) return;

      final List<ExpenseItemEntity> parsedItems = [];
      if (result['items'] != null) {
        final itemList = result['items'] as List<Map<String, dynamic>>;
        for (final item in itemList) {
          parsedItems.add(ExpenseItemEntity(
            expenseId: -1,
            itemName: item['name'] as String,
            price: (item['price'] as num).toDouble(),
          ));
        }
      }

      final expense = ExpenseEntity(
        id: -1,
        userId: '',
        storeName: result['storeName'] as String? ?? 'Unknown',
        totalAmount: (result['amount'] as num?)?.toDouble() ?? 0.0,
        categoryId: 12, // default "Other" category
        gstAmount: result['gst'] as double?,
        receiptNumber: result['receiptNumber'] as String?,
        paymentMethod: result['paymentMethod'] as String? ?? 'Cash',
        notes: result['notes'] as String?,
        items: parsedItems,
        date: result['date'] as DateTime? ?? DateTime.now(),
        imagePath: image.path,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      if (mounted) {
        context.push(AppRoutes.addExpense, extra: expense);
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to scan receipt: $e'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
          _statusMessage = 'Align receipt within frame';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.of(context).padding.bottom;
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;
    final frameH = screenH * 0.58;
    final frameW = screenW * 0.85;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => context.go('/dashboard'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_off_rounded, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Gradient background (simulated camera)
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1E293B), Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),

                // Corner-only frame (Google Lens style)
                SizedBox(
                  width: frameW,
                  height: frameH,
                  child: CustomPaint(painter: _CornerFramePainter()),
                ),

                // Animated scan line
                if (_isProcessing)
                  AnimatedBuilder(
                    animation: _scanAnimCtrl,
                    builder: (context, _) {
                      return Positioned(
                        top: (screenH - frameH) / 2 +
                            _scanAnimCtrl.value * (frameH - 4),
                        left: (screenW - frameW) / 2 + 4,
                        right: (screenW - frameW) / 2 + 4,
                        child: Container(
                          height: 3,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.transparent,
                                AppColors.accent,
                                Colors.transparent,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accent.withValues(alpha: 0.6),
                                blurRadius: 8,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                // Status / Processing overlay
                if (_isProcessing)
                  Positioned(
                    bottom: (screenH - frameH) / 2 - 48,
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.accent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _statusMessage,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ).animate().shimmer(duration: 1200.ms),
                      ],
                    ),
                  )
                else
                  Positioned(
                    bottom: (screenH - frameH) / 2 - 44,
                    child: const Text(
                      'Position receipt inside the frame',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ),
              ],
            ),
          ),

          // Bottom Controls — respects SafeArea bottom
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(
              left: 40,
              right: 40,
              top: 14,
              bottom: bottomPad + 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Gallery
                _CircleIconBtn(
                  icon: Icons.photo_library_outlined,
                  label: 'Gallery',
                  onTap: _isProcessing
                      ? null
                      : () => _scanReceipt(ImageSource.gallery),
                ),

                // Capture
                GestureDetector(
                  onTap: _isProcessing
                      ? null
                      : () => _scanReceipt(ImageSource.camera),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      color: _isProcessing ? Colors.grey : AppColors.accent,
                      boxShadow: _isProcessing
                          ? []
                          : [
                              BoxShadow(
                                color: AppColors.accent.withValues(alpha: 0.5),
                                blurRadius: 20,
                                spreadRadius: 4,
                              ),
                            ],
                    ),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),

                // Manual entry shortcut
                _CircleIconBtn(
                  icon: Icons.edit_note_rounded,
                  label: 'Manual',
                  onTap: _isProcessing
                      ? null
                      : () => context.push(AppRoutes.addExpense),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Corner-only frame painter (Google Lens / Adobe Scan style)
class _CornerFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.accent
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const corner = 28.0; // corner length
    const radius = 16.0;
    const r = Radius.circular(radius);

    // Top-left
    canvas.drawPath(
      Path()
        ..moveTo(0, corner)
        ..arcToPoint(const Offset(radius, 0), radius: r)
        ..lineTo(corner, 0),
      paint,
    );
    // Top-right
    canvas.drawPath(
      Path()
        ..moveTo(size.width - corner, 0)
        ..arcToPoint(Offset(size.width, radius), radius: r)
        ..lineTo(size.width, corner),
      paint,
    );
    // Bottom-left
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height - corner)
        ..arcToPoint(Offset(radius, size.height), radius: r)
        ..lineTo(corner, size.height),
      paint,
    );
    // Bottom-right
    canvas.drawPath(
      Path()
        ..moveTo(size.width - corner, size.height)
        ..arcToPoint(Offset(size.width, size.height - radius), radius: r)
        ..lineTo(size.width, size.height - corner),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _CircleIconBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _CircleIconBtn({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white12,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.white60, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
