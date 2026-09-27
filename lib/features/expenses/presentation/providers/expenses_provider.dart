import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ai_expense_scanner/features/auth/presentation/providers/auth_provider.dart';
import 'package:ai_expense_scanner/features/expenses/data/repositories/expense_repository_impl.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/category_entity.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/expense_entity.dart';
import 'package:ai_expense_scanner/features/expenses/domain/repositories/expense_repository.dart';

part 'expenses_provider.g.dart';

@riverpod
ExpenseRepository expenseRepository(Ref ref) {
  final db = ref.read(appDatabaseProvider);
  return ExpenseRepositoryImpl(db);
}

@riverpod
class CategoriesNotifier extends _$CategoriesNotifier {
  @override
  Future<List<CategoryEntity>> build() async {
    return ref.read(expenseRepositoryProvider).getAllCategories();
  }

  Future<void> addCategory(CategoryEntity category) async {
    await ref.read(expenseRepositoryProvider).addCategory(category);
    ref.invalidateSelf();
  }

  Future<void> updateCategory(CategoryEntity category) async {
    await ref.read(expenseRepositoryProvider).updateCategory(category);
    ref.invalidateSelf();
  }

  Future<void> deleteCategory(int id) async {
    await ref.read(expenseRepositoryProvider).deleteCategory(id);
    ref.invalidateSelf();
  }
}

@riverpod
class ExpensesNotifier extends _$ExpensesNotifier {
  String? _searchQuery;
  int? _filterCategoryId;

  @override
  Future<List<ExpenseEntity>> build() async {
    final user = ref.watch(authProvider).value;
    if (user == null) return [];
    return _fetchExpenses(user.id);
  }

  Future<List<ExpenseEntity>> _fetchExpenses(String userId) async {
    final repo = ref.read(expenseRepositoryProvider);
    if (_searchQuery != null && _searchQuery!.isNotEmpty) {
      return repo.searchExpenses(userId, _searchQuery!);
    }
    if (_filterCategoryId != null) {
      return repo.getExpensesByCategory(userId, _filterCategoryId!);
    }
    return repo.getAllExpenses(userId);
  }

  Future<void> addExpense(ExpenseEntity expense) async {
    await ref.read(expenseRepositoryProvider).addExpense(expense);
    _invalidateRelated();
  }

  Future<void> updateExpense(ExpenseEntity expense) async {
    await ref.read(expenseRepositoryProvider).updateExpense(expense);
    _invalidateRelated();
  }

  Future<void> deleteExpense(int id) async {
    await ref.read(expenseRepositoryProvider).deleteExpense(id);
    _invalidateRelated();
  }

  void searchExpenses(String query) {
    _searchQuery = query;
    _filterCategoryId = null;
    ref.invalidateSelf();
  }

  void filterByCategory(int? categoryId) {
    _filterCategoryId = categoryId;
    _searchQuery = null;
    ref.invalidateSelf();
  }

  void clearFilters() {
    _searchQuery = null;
    _filterCategoryId = null;
    ref.invalidateSelf();
  }

  Future<ExpenseEntity?> checkDuplicate({
    required String userId,
    required String? receiptNumber,
    required double amount,
    required DateTime date,
  }) {
    return ref
        .read(expenseRepositoryProvider)
        .findDuplicate(userId, receiptNumber, amount, date);
  }

  void _invalidateRelated() {
    ref.invalidateSelf();
    // These will be defined in their own providers — guarded invalidation
    try {
      ref.invalidate(expenseRepositoryProvider);
    } catch (_) {}
  }
}
