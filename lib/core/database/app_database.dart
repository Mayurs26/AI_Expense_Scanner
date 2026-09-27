import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

// ─────────────────────────────────────────────
// TABLE DEFINITIONS
// ─────────────────────────────────────────────

class Users extends Table {
  TextColumn get id => text()(); // Google UID
  TextColumn get displayName => text()();
  TextColumn get email => text()();
  TextColumn get photoUrl => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get icon => text()(); // icon codepoint as hex string
  IntColumn get color => integer()(); // ARGB
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();
}

class Budgets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer().references(Categories, #id)();
  IntColumn get month => integer()(); // 1–12
  IntColumn get year => integer()();
  RealColumn get amount => real()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get storeName => text()();
  RealColumn get totalAmount => real()();
  RealColumn get gstAmount => real().nullable()();
  IntColumn get categoryId => integer().references(Categories, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get receiptNumber => text().nullable()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get paymentMethod => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get tags => text().nullable()(); // comma-separated: "#work,#travel"
  BoolColumn get isDuplicateFlagged =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class ExpenseItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get expenseId => integer().references(Expenses, #id)();
  TextColumn get itemName => text()();
  RealColumn get price => real()();
}

class ChatMessages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get role => text()(); // "user" or "model"
  TextColumn get content => text()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
  TextColumn get contextSnapshot => text().nullable()(); // JSON context sent
}

class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

// ─────────────────────────────────────────────
// DAOs
// ─────────────────────────────────────────────

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<User?> getUserById(String id) =>
      (select(users)..where((u) => u.id.equals(id))).getSingleOrNull();

  Future<int> insertUser(UsersCompanion user) => into(users).insertOnConflictUpdate(user);

  Future<bool> updateUser(UsersCompanion user) => update(users).replace(user);
}

@DriftAccessor(tables: [Categories])
class CategoryDao extends DatabaseAccessor<AppDatabase> with _$CategoryDaoMixin {
  CategoryDao(super.db);

  Future<List<Category>> getAllCategories() => select(categories).get();

  Stream<List<Category>> watchAllCategories() => select(categories).watch();

  Future<int> insertCategory(CategoriesCompanion cat) =>
      into(categories).insert(cat);

  Future<bool> updateCategory(CategoriesCompanion cat) =>
      update(categories).replace(cat);

  Future<int> deleteCategory(int id) =>
      (delete(categories)..where((c) => c.id.equals(id))).go();
}

@DriftAccessor(tables: [Budgets, Categories])
class BudgetDao extends DatabaseAccessor<AppDatabase> with _$BudgetDaoMixin {
  BudgetDao(super.db);

  Future<List<Budget>> getBudgetsByMonthYear(int month, int year) =>
      (select(budgets)
            ..where((b) => b.month.equals(month) & b.year.equals(year)))
          .get();

  Future<Budget?> getBudgetForCategory(
          int categoryId, int month, int year) =>
      (select(budgets)
            ..where((b) =>
                b.categoryId.equals(categoryId) &
                b.month.equals(month) &
                b.year.equals(year)))
          .getSingleOrNull();

  Future<int> upsertBudget(BudgetsCompanion budget) =>
      into(budgets).insertOnConflictUpdate(budget);

  Future<int> deleteBudget(int id) =>
      (delete(budgets)..where((b) => b.id.equals(id))).go();
}

@DriftAccessor(tables: [Expenses, Categories])
class ExpenseDao extends DatabaseAccessor<AppDatabase> with _$ExpenseDaoMixin {
  ExpenseDao(super.db);

  // ── Queries ──

  Future<List<Expense>> getAllExpenses(String userId) =>
      (select(expenses)
            ..where((e) => e.userId.equals(userId))
            ..orderBy([(e) => OrderingTerm.desc(e.date)]))
          .get();

  Stream<List<Expense>> watchAllExpenses(String userId) =>
      (select(expenses)
            ..where((e) => e.userId.equals(userId))
            ..orderBy([(e) => OrderingTerm.desc(e.date)]))
          .watch();

  Future<List<Expense>> getExpensesByMonth(
          String userId, int month, int year) =>
      (select(expenses)
            ..where((e) =>
                e.userId.equals(userId) &
                e.date.month.equals(month) &
                e.date.year.equals(year))
            ..orderBy([(e) => OrderingTerm.desc(e.date)]))
          .get();

  Stream<List<Expense>> watchExpensesByMonth(
          String userId, int month, int year) =>
      (select(expenses)
            ..where((e) =>
                e.userId.equals(userId) &
                e.date.month.equals(month) &
                e.date.year.equals(year))
            ..orderBy([(e) => OrderingTerm.desc(e.date)]))
          .watch();

  Future<List<Expense>> getRecentExpenses(String userId, {int limit = 5}) =>
      (select(expenses)
            ..where((e) => e.userId.equals(userId))
            ..orderBy([(e) => OrderingTerm.desc(e.date)])
            ..limit(limit))
          .get();

  Future<List<Expense>> searchExpenses(String userId, String query) =>
      (select(expenses)
            ..where((e) =>
                e.userId.equals(userId) &
                (e.storeName.contains(query) | e.notes.contains(query)))
            ..orderBy([(e) => OrderingTerm.desc(e.date)]))
          .get();

  Future<List<Expense>> getExpensesByCategory(
          String userId, int categoryId) =>
      (select(expenses)
            ..where((e) =>
                e.userId.equals(userId) & e.categoryId.equals(categoryId))
            ..orderBy([(e) => OrderingTerm.desc(e.date)]))
          .get();

  Future<List<Expense>> getExpensesInRange(
          String userId, DateTime from, DateTime to) =>
      (select(expenses)
            ..where((e) =>
                e.userId.equals(userId) &
                e.date.isBiggerOrEqualValue(from) &
                e.date.isSmallerOrEqualValue(to))
            ..orderBy([(e) => OrderingTerm.asc(e.date)]))
          .get();

  Future<Expense?> findDuplicate(
      String userId, String? receiptNumber, double amount, DateTime date) {
    final query = select(expenses)
      ..where((e) =>
          e.userId.equals(userId) &
          e.totalAmount.equals(amount) &
          e.date.equals(date));
    if (receiptNumber != null && receiptNumber.isNotEmpty) {
      query.where((e) => e.receiptNumber.equals(receiptNumber));
    }
    return query.getSingleOrNull();
  }

  // ── CRUD ──

  Future<int> insertExpense(ExpensesCompanion expense) =>
      into(expenses).insert(expense);

  Future<bool> updateExpense(ExpensesCompanion expense) =>
      update(expenses).replace(expense);

  Future<int> deleteExpense(int id) =>
      (delete(expenses)..where((e) => e.id.equals(id))).go();

  // ── Aggregates ──

  Future<double> getTotalSpentInMonth(
      String userId, int month, int year) async {
    final result = await (select(expenses)
          ..where((e) =>
              e.userId.equals(userId) &
              e.date.month.equals(month) &
              e.date.year.equals(year)))
        .get();
    return result.fold<double>(0.0, (sum, e) => sum + e.totalAmount);
  }

  Future<Map<int, double>> getSpendingByCategory(
      String userId, int month, int year) async {
    final result = await getExpensesByMonth(userId, month, year);
    final Map<int, double> map = {};
    for (final e in result) {
      map[e.categoryId] = (map[e.categoryId] ?? 0) + e.totalAmount;
    }
    return map;
  }
}

@DriftAccessor(tables: [ExpenseItems])
class ExpenseItemDao
    extends DatabaseAccessor<AppDatabase> with _$ExpenseItemDaoMixin {
  ExpenseItemDao(super.db);

  Future<List<ExpenseItem>> getItemsForExpense(int expenseId) =>
      (select(expenseItems)
            ..where((i) => i.expenseId.equals(expenseId)))
          .get();

  Future<int> insertItem(ExpenseItemsCompanion item) =>
      into(expenseItems).insert(item);

  Future<int> deleteItemsByExpense(int expenseId) =>
      (delete(expenseItems)..where((i) => i.expenseId.equals(expenseId))).go();
}

@DriftAccessor(tables: [ChatMessages])
class ChatDao extends DatabaseAccessor<AppDatabase> with _$ChatDaoMixin {
  ChatDao(super.db);

  Stream<List<ChatMessage>> watchAllMessages() =>
      (select(chatMessages)
            ..orderBy([(m) => OrderingTerm.asc(m.timestamp)]))
          .watch();

  Future<List<ChatMessage>> getAllMessages() =>
      (select(chatMessages)
            ..orderBy([(m) => OrderingTerm.asc(m.timestamp)]))
          .get();

  Future<int> insertMessage(ChatMessagesCompanion msg) =>
      into(chatMessages).insert(msg);

  Future<int> clearAll() => delete(chatMessages).go();
}

@DriftAccessor(tables: [Settings])
class SettingsDao extends DatabaseAccessor<AppDatabase> with _$SettingsDaoMixin {
  SettingsDao(super.db);

  Future<Setting?> getValue(String key) =>
      (select(settings)..where((s) => s.key.equals(key))).getSingleOrNull();

  Future<int> setValue(String key, String value) =>
      into(settings).insertOnConflictUpdate(
          SettingsCompanion.insert(key: key, value: value));

  Future<int> deleteKey(String key) =>
      (delete(settings)..where((s) => s.key.equals(key))).go();

  Future<int> clearAll() => delete(settings).go();
}

// ─────────────────────────────────────────────
// DATABASE
// ─────────────────────────────────────────────

@DriftDatabase(
  tables: [Users, Categories, Budgets, Expenses, ExpenseItems, ChatMessages, Settings],
  daos: [UserDao, CategoryDao, BudgetDao, ExpenseDao, ExpenseItemDao, ChatDao, SettingsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _seedDefaultCategories();
        },
        onUpgrade: (m, from, to) async {
          // Future migrations go here
          // e.g. if (from < 2) { await m.addColumn(expenses, expenses.newColumn); }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  /// Seed the 12 default categories on first launch
  Future<void> _seedDefaultCategories() async {
    final defaults = [
      CategoriesCompanion.insert(
          name: 'Groceries', icon: 'e6b7', color: 0xFF4CAF50),
      CategoriesCompanion.insert(
          name: 'Food & Dining', icon: 'e56c', color: 0xFFFF7043),
      CategoriesCompanion.insert(
          name: 'Transport', icon: 'e1d8', color: 0xFF42A5F5),
      CategoriesCompanion.insert(
          name: 'Healthcare', icon: 'e548', color: 0xFFEC407A),
      CategoriesCompanion.insert(
          name: 'Shopping', icon: 'e8cc', color: 0xFFAB47BC),
      CategoriesCompanion.insert(
          name: 'Utilities', icon: 'e0f7', color: 0xFFFFCA28),
      CategoriesCompanion.insert(
          name: 'Entertainment', icon: 'e04a', color: 0xFF26C6DA),
      CategoriesCompanion.insert(
          name: 'Education', icon: 'e80c', color: 0xFF5C6BC0),
      CategoriesCompanion.insert(
          name: 'Travel', icon: 'e7ef', color: 0xFF26A69A),
      CategoriesCompanion.insert(
          name: 'Business', icon: 'e8f9', color: 0xFF78909C),
      CategoriesCompanion.insert(
          name: 'Rent', icon: 'e88a', color: 0xFFFF7043),
      CategoriesCompanion.insert(
          name: 'Other', icon: 'e8b8', color: 0xFF90A4AE),
    ];
    for (final cat in defaults) {
      await into(categories).insert(cat);
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ai_expense_scanner.db'));
    return NativeDatabase.createInBackground(file);
  });
}
