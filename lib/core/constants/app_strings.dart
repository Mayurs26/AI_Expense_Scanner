abstract class AppStrings {
  // App
  static const String appName = 'AI Expense Scanner';
  static const String appTagline = 'Smart spending, smarter saving';

  // Auth
  static const String signInWithGoogle = 'Continue with Google';
  static const String signOut = 'Sign Out';
  static const String welcome = 'Welcome back';
  static const String tagline = 'Your AI-powered finance companion';

  // Navigation
  static const String navHome = 'Home';
  static const String navScan = 'Scan';
  static const String navHistory = 'History';
  static const String navAnalytics = 'Analytics';
  static const String navSettings = 'Settings';

  // Dashboard
  static const String monthlySpend = 'Monthly Spend';
  static const String remainingBudget = 'Remaining Budget';
  static const String recentExpenses = 'Recent Expenses';
  static const String quickActions = 'Quick Actions';
  static const String viewAll = 'View All';
  static const String spendingStreak = 'Spending Streak';
  static const String daysUnderBudget = 'days under budget';
  static const String addExpense = 'Add Expense';
  static const String scanReceipt = 'Scan Receipt';
  static const String aiInsights = 'AI Insights';
  static const String exportData = 'Export Data';

  // Expenses
  static const String expenses = 'Expenses';
  static const String expenseHistory = 'Expense History';
  static const String noExpensesYet = 'No expenses yet';
  static const String noExpensesDesc = 'Add your first expense to get started';
  static const String storeName = 'Store / Merchant';
  static const String totalAmount = 'Total Amount';
  static const String category = 'Category';
  static const String date = 'Date';
  static const String receiptNumber = 'Receipt Number';
  static const String notes = 'Notes';
  static const String tags = 'Tags (e.g. #work, #travel)';
  static const String paymentMethod = 'Payment Method';
  static const String gstAmount = 'GST / Tax Amount';
  static const String saveExpense = 'Save Expense';
  static const String updateExpense = 'Update Expense';
  static const String deleteExpense = 'Delete Expense';
  static const String deleteConfirm = 'Delete this expense?';
  static const String deleteDesc = 'This action cannot be undone.';
  static const String cancel = 'Cancel';
  static const String delete = 'Delete';
  static const String save = 'Save';
  static const String edit = 'Edit';
  static const String search = 'Search expenses...';
  static const String lineItems = 'Line Items';
  static const String addItem = 'Add Item';
  static const String itemName = 'Item name';
  static const String price = 'Price';

  // Duplicate
  static const String duplicateFound = 'Duplicate Receipt Detected';
  static const String duplicateDesc =
      'A receipt with the same number, amount, and date already exists.';
  static const String viewExisting = 'View Existing';
  static const String saveAnyway = 'Save Anyway';

  // Analytics
  static const String analytics = 'Analytics';
  static const String spendingByCategory = 'Spending by Category';
  static const String weeklySpending = 'Weekly Spending';
  static const String monthlyTrend = 'Monthly Trend';
  static const String topCategories = 'Top Categories';
  static const String unusualSpend = 'Unusual Spending Detected';
  static const String noDataYet = 'No data yet';
  static const String noDataDesc = 'Add expenses to see your analytics';

  // Settings
  static const String settings = 'Settings';
  static const String profile = 'Profile';
  static const String theme = 'Theme';
  static const String currency = 'Currency';
  static const String manageCategories = 'Manage Categories';
  static const String monthlyBudget = 'Monthly Budget';
  static const String exportCsv = 'Export to CSV';
  static const String biometricLock = 'Biometric Lock';
  static const String dataPrivacy = 'Data & Privacy';
  static const String clearAllData = 'Clear All Data';
  static const String exportLocalData = 'Export Local Data';
  static const String clearConfirm = 'Clear all data?';
  static const String clearDesc =
      'This will permanently delete all expenses, budgets, and settings.';
  static const String lightMode = 'Light';
  static const String darkMode = 'Dark';
  static const String systemMode = 'System';

  // Payment Methods
  static const String cash = 'Cash';
  static const String card = 'Card';
  static const String upi = 'UPI';
  static const String netBanking = 'Net Banking';
  static const String other = 'Other';

  // AI Chat
  static const String aiAssistant = 'AI Assistant';
  static const String typeMessage = 'Ask me anything...';
  static const String thinking = 'Thinking...';
  static const String noChatsYet = 'No conversations yet';
  static const String noChatsDesc = 'Ask me about your spending habits';

  // Errors
  static const String somethingWentWrong = 'Something went wrong';
  static const String tryAgain = 'Try Again';
  static const String noInternet = 'You\'re offline';
  static const String noInternetDesc = 'Some features require internet access';
  static const String cameraPermission = 'Camera permission required';
  static const String biometricFailed = 'Authentication failed';

  // Scanner (Stage 2 placeholders)
  static const String scannerComingSoon = '📸 Receipt Scanner';
  static const String scannerComingSoonDesc =
      'Point your camera at a receipt to auto-fill expense details';
  static const String manualEntry = 'Enter Manually';
}
