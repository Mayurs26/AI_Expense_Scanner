import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_expense_scanner/core/constants/app_colors.dart';
import 'package:ai_expense_scanner/core/constants/app_sizes.dart';
import 'package:ai_expense_scanner/core/services/haptic_service.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/category_entity.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/providers/expenses_provider.dart';

class ManageCategoriesScreen extends ConsumerWidget {
  const ManageCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            tooltip: 'Add Category',
            onPressed: () => _showAddCategorySheet(context, ref),
          ),
        ],
      ),
      body: categoriesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (categories) => ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
          itemCount: categories.length,
          separatorBuilder: (_, __) => const Divider(height: 0, indent: 72),
          itemBuilder: (context, index) {
            final cat = categories[index];
            return _CategoryTile(
              category: cat,
              onEdit: () => _showEditCategorySheet(context, ref, cat),
              onDelete: cat.isCustom
                  ? () => _confirmDelete(context, ref, cat)
                  : null,
            );
          },
        ),
      ),
    );
  }

  void _showAddCategorySheet(BuildContext context, WidgetRef ref) {
    _showCategorySheet(context, ref, null);
  }

  void _showEditCategorySheet(
      BuildContext context, WidgetRef ref, CategoryEntity cat) {
    _showCategorySheet(context, ref, cat);
  }

  void _showCategorySheet(
      BuildContext context, WidgetRef ref, CategoryEntity? existing) {
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    int selectedColor = existing?.color ?? AppColors.accent.toARGB32();

    final colors = [
      AppColors.catGroceries.toARGB32(),
      AppColors.catFood.toARGB32(),
      AppColors.catTransport.toARGB32(),
      AppColors.catHealthcare.toARGB32(),
      AppColors.catShopping.toARGB32(),
      AppColors.catUtilities.toARGB32(),
      AppColors.catEntertainment.toARGB32(),
      AppColors.catEducation.toARGB32(),
      AppColors.catTravel.toARGB32(),
      AppColors.catBusiness.toARGB32(),
      AppColors.accent.toARGB32(),
      AppColors.info.toARGB32(),
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSizes.radiusXl)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => Padding(
          padding: EdgeInsets.fromLTRB(
            AppSizes.pagePadding,
            AppSizes.lg,
            AppSizes.pagePadding,
            MediaQuery.of(ctx).viewInsets.bottom + AppSizes.xl,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                existing == null ? 'Add Category' : 'Edit Category',
                style: Theme.of(ctx).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSizes.lg),
              TextField(
                controller: nameCtrl,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Category name',
                  prefixIcon: Icon(Icons.category_outlined),
                ),
              ),
              const SizedBox(height: AppSizes.lg),
              Text('Color', style: Theme.of(ctx).textTheme.titleSmall),
              const SizedBox(height: AppSizes.sm),
              Wrap(
                spacing: AppSizes.sm,
                runSpacing: AppSizes.sm,
                children: colors.map((c) {
                  final isSelected = c == selectedColor;
                  return GestureDetector(
                    onTap: () => setState(() => selectedColor = c),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Color(c),
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(color: Colors.white, width: 3)
                            : null,
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                    color: Color(c).withValues(alpha: 0.5),
                                    blurRadius: 8)
                              ]
                            : null,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: AppSizes.xl),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (nameCtrl.text.trim().isEmpty) return;
                    await HapticService.medium();
                    final category = CategoryEntity(
                      id: existing?.id ?? 0,
                      name: nameCtrl.text.trim(),
                      icon: 'e8b8',
                      color: selectedColor,
                      isCustom: true,
                    );
                    if (existing == null) {
                      await ref
                          .read(categoriesProvider.notifier)
                          .addCategory(category);
                    } else {
                      await ref
                          .read(categoriesProvider.notifier)
                          .updateCategory(category);
                    }
                    if (ctx.mounted) Navigator.pop(ctx);
                  },
                  child: Text(existing == null ? 'Add Category' : 'Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmDelete(
      BuildContext context, WidgetRef ref, CategoryEntity cat) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Category?'),
        content: Text(
            '"${cat.name}" will be deleted. Existing expenses won\'t be affected.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await HapticService.heavy();
      await ref
          .read(categoriesProvider.notifier)
          .deleteCategory(cat.id);
    }
  }
}

class _CategoryTile extends StatelessWidget {
  final CategoryEntity category;
  final VoidCallback onEdit;
  final VoidCallback? onDelete;

  const _CategoryTile({
    required this.category,
    required this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final color = Color(category.color);
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        ),
        child: Icon(Icons.category_rounded, color: color, size: 20),
      ),
      title: Text(category.name,
          style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: category.isCustom
          ? const Text('Custom',
              style: TextStyle(fontSize: 11, color: AppColors.accent))
          : const Text('Default', style: TextStyle(fontSize: 11)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, size: 20),
            onPressed: onEdit,
          ),
          if (onDelete != null)
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded,
                  size: 20, color: AppColors.error),
              onPressed: onDelete,
            ),
        ],
      ),
    );
  }
}
