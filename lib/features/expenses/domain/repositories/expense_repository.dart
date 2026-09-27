import 'package:ai_expense_scanner/features/expenses/domain/entities/category_entity.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/expense_entity.dart';

abstract class ExpenseRepository {
  Stream<List<ExpenseEntity>> watchExpenses(String userId);
  Future<List<ExpenseEntity>> getAllExpenses(String userId);
  Future<List<ExpenseEntity>> getExpensesByMonth(String userId, int month, int year);
  Future<List<ExpenseEntity>> searchExpenses(String userId, String query);
  Future<List<ExpenseEntity>> getExpensesByCategory(String userId, int categoryId);
  Future<ExpenseEntity?> findDuplicate(String userId, String? receiptNumber, double amount, DateTime date);
  Future<int> addExpense(ExpenseEntity expense);
  Future<void> updateExpense(ExpenseEntity expense);
  Future<void> deleteExpense(int id);

  Stream<List<CategoryEntity>> watchCategories();
  Future<List<CategoryEntity>> getAllCategories();
  Future<int> addCategory(CategoryEntity category);
  Future<void> updateCategory(CategoryEntity category);
  Future<void> deleteCategory(int id);
}
