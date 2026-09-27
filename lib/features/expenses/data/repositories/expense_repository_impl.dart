import 'package:drift/drift.dart' show Value;
import 'package:ai_expense_scanner/core/database/app_database.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/category_entity.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/expense_entity.dart';
import 'package:ai_expense_scanner/features/expenses/domain/repositories/expense_repository.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final AppDatabase _db;

  ExpenseRepositoryImpl(this._db);

  // ─── Expense mapping ───────────────────────────────────────────────────────

  Future<ExpenseEntity> _enrichExpense(Expense e) async {
    final category = await (_db.select(_db.categories)
          ..where((c) => c.id.equals(e.categoryId)))
        .getSingleOrNull();
    final items = await _db.expenseItemDao.getItemsForExpense(e.id);
    return ExpenseEntity(
      id: e.id,
      userId: e.userId,
      storeName: e.storeName,
      totalAmount: e.totalAmount,
      gstAmount: e.gstAmount,
      categoryId: e.categoryId,
      categoryName: category?.name,
      categoryColor: category?.color,
      date: e.date,
      receiptNumber: e.receiptNumber,
      imagePath: e.imagePath,
      paymentMethod: e.paymentMethod,
      notes: e.notes,
      tags: e.tags,
      isDuplicateFlagged: e.isDuplicateFlagged,
      createdAt: e.createdAt,
      updatedAt: e.updatedAt,
      items: items
          .map((i) => ExpenseItemEntity(
                id: i.id,
                expenseId: i.expenseId,
                itemName: i.itemName,
                price: i.price,
              ))
          .toList(),
    );
  }

  Future<List<ExpenseEntity>> _enrichAll(List<Expense> expenses) async {
    return Future.wait(expenses.map(_enrichExpense));
  }

  // ─── Expense CRUD ──────────────────────────────────────────────────────────

  @override
  Stream<List<ExpenseEntity>> watchExpenses(String userId) {
    return _db.expenseDao.watchAllExpenses(userId).asyncMap(_enrichAll);
  }

  @override
  Future<List<ExpenseEntity>> getAllExpenses(String userId) async {
    final list = await _db.expenseDao.getAllExpenses(userId);
    return _enrichAll(list);
  }

  @override
  Future<List<ExpenseEntity>> getExpensesByMonth(
      String userId, int month, int year) async {
    final list = await _db.expenseDao.getExpensesByMonth(userId, month, year);
    return _enrichAll(list);
  }

  @override
  Future<List<ExpenseEntity>> searchExpenses(String userId, String query) async {
    final list = await _db.expenseDao.searchExpenses(userId, query);
    return _enrichAll(list);
  }

  @override
  Future<List<ExpenseEntity>> getExpensesByCategory(
      String userId, int categoryId) async {
    final list =
        await _db.expenseDao.getExpensesByCategory(userId, categoryId);
    return _enrichAll(list);
  }

  @override
  Future<ExpenseEntity?> findDuplicate(
      String userId, String? receiptNumber, double amount, DateTime date) async {
    final e = await _db.expenseDao
        .findDuplicate(userId, receiptNumber, amount, date);
    if (e == null) return null;
    return _enrichExpense(e);
  }

  @override
  Future<int> addExpense(ExpenseEntity expense) async {
    final id = await _db.expenseDao.insertExpense(
      ExpensesCompanion.insert(
        userId: expense.userId,
        storeName: expense.storeName,
        totalAmount: expense.totalAmount,
        gstAmount: Value(expense.gstAmount),
        categoryId: expense.categoryId,
        date: expense.date,
        receiptNumber: Value(expense.receiptNumber),
        imagePath: Value(expense.imagePath),
        paymentMethod: Value(expense.paymentMethod),
        notes: Value(expense.notes),
        tags: Value(expense.tags),
        isDuplicateFlagged: Value(expense.isDuplicateFlagged),
      ),
    );
    // Insert line items
    for (final item in expense.items) {
      await _db.expenseItemDao.insertItem(
        ExpenseItemsCompanion.insert(
          expenseId: id,
          itemName: item.itemName,
          price: item.price,
        ),
      );
    }
    return id;
  }

  @override
  Future<void> updateExpense(ExpenseEntity expense) async {
    await _db.expenseDao.updateExpense(
      ExpensesCompanion(
        id: Value(expense.id!),
        userId: Value(expense.userId),
        storeName: Value(expense.storeName),
        totalAmount: Value(expense.totalAmount),
        gstAmount: Value(expense.gstAmount),
        categoryId: Value(expense.categoryId),
        date: Value(expense.date),
        receiptNumber: Value(expense.receiptNumber),
        imagePath: Value(expense.imagePath),
        paymentMethod: Value(expense.paymentMethod),
        notes: Value(expense.notes),
        tags: Value(expense.tags),
        updatedAt: Value(DateTime.now()),
      ),
    );
    // Replace items
    await _db.expenseItemDao.deleteItemsByExpense(expense.id!);
    for (final item in expense.items) {
      await _db.expenseItemDao.insertItem(
        ExpenseItemsCompanion.insert(
          expenseId: expense.id!,
          itemName: item.itemName,
          price: item.price,
        ),
      );
    }
  }

  @override
  Future<void> deleteExpense(int id) async {
    await _db.expenseItemDao.deleteItemsByExpense(id);
    await _db.expenseDao.deleteExpense(id);
  }

  // ─── Categories ────────────────────────────────────────────────────────────

  @override
  Stream<List<CategoryEntity>> watchCategories() {
    return _db.categoryDao.watchAllCategories().map(
          (list) => list
              .map((c) => CategoryEntity(
                    id: c.id,
                    name: c.name,
                    icon: c.icon,
                    color: c.color,
                    isCustom: c.isCustom,
                  ))
              .toList(),
        );
  }

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    final list = await _db.categoryDao.getAllCategories();
    return list
        .map((c) => CategoryEntity(
              id: c.id,
              name: c.name,
              icon: c.icon,
              color: c.color,
              isCustom: c.isCustom,
            ))
        .toList();
  }

  @override
  Future<int> addCategory(CategoryEntity category) =>
      _db.categoryDao.insertCategory(
        CategoriesCompanion.insert(
          name: category.name,
          icon: category.icon,
          color: category.color,
          isCustom: Value(category.isCustom),
        ),
      );

  @override
  Future<void> updateCategory(CategoryEntity category) =>
      _db.categoryDao.updateCategory(
        CategoriesCompanion(
          id: Value(category.id),
          name: Value(category.name),
          icon: Value(category.icon),
          color: Value(category.color),
          isCustom: Value(category.isCustom),
        ),
      );

  @override
  Future<void> deleteCategory(int id) => _db.categoryDao.deleteCategory(id);
}
