abstract class AppRoutes {
  // Auth
  static const String splash = '/';
  static const String login = '/login';

  // Main shell tabs
  static const String dashboard = '/dashboard';
  static const String scan = '/scan';
  static const String history = '/history';
  static const String analytics = '/analytics';
  static const String settings = '/settings';

  // Expenses
  static const String addExpense = '/add-expense';
  static const String expenseDetail = '/expense/:id';
  static const String expenseDetailEdit = '/expense/:id/edit';

  // Settings sub-screens
  static const String manageCategories = '/settings/categories';
  static const String budgetConfig = '/settings/budget';

  // AI Chat
  static const String aiChat = '/ai-chat';

  // Helpers
  static String expenseDetailPath(int id) => '/expense/$id';
  static String expenseEditPath(int id) => '/expense/$id/edit';
}
