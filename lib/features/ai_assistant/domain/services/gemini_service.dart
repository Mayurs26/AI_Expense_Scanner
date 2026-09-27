import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:ai_expense_scanner/features/auth/presentation/providers/auth_provider.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/providers/expenses_provider.dart';

final geminiServiceProvider = Provider<GeminiService>((ref) {
  return GeminiService(ref);
});

class GeminiService {
  final Ref _ref;
  GenerativeModel? _model;
  ChatSession? _chatSession;

  GeminiService(this._ref) {
    // Retrieve API key from --dart-define=GEMINI_API_KEY=<key> at build time.
    const apiKey = String.fromEnvironment('GEMINI_API_KEY', defaultValue: '');
    if (apiKey.isNotEmpty) {
      _model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: apiKey,
      );
      _chatSession = _model?.startChat();
    }
  }

  Future<String> sendMessage(String message) async {
    // If no API key, use the local mock AI flow
    if (_model == null) {
      return _generateLocalMockResponse(message);
    }

    try {
      final contextPayload = await _buildContextPayload();

      final response = await _chatSession?.sendMessage(
        Content.text(
          'Context from user\'s local database: $contextPayload\n\nUser Question: $message',
        ),
      );

      return response?.text ?? 'Sorry, I could not generate a response.';
    } catch (e) {
      return 'Error communicating with Gemini: $e';
    }
  }

  Future<String> _buildContextPayload() async {
    try {
      final user = _ref.read(authProvider).value;
      if (user == null) return 'No user logged in.';

      final expenses =
          await _ref.read(expenseRepositoryProvider).getAllExpenses(user.id);

      double totalSpent = 0;
      final Map<String, double> categoryTotals = {};

      for (final e in expenses) {
        totalSpent += e.totalAmount;
        final catName = e.categoryName ?? 'Other';
        categoryTotals[catName] = (categoryTotals[catName] ?? 0) + e.totalAmount;
      }

      return '''
Total Spent: ₹$totalSpent
Category Breakdown: $categoryTotals
Expense Count: ${expenses.length}
''';
    } catch (e) {
      return 'Failed to load context.';
    }
  }

  Future<String> _generateLocalMockResponse(String message) async {
    final lowerMsg = message.toLowerCase();
    await Future.delayed(const Duration(seconds: 1));

    final user = _ref.read(authProvider).value;
    if (user == null) return 'Please log in to see your insights.';

    final expenses =
        await _ref.read(expenseRepositoryProvider).getAllExpenses(user.id);
    
    if (expenses.isEmpty) {
      return 'No expenses yet. 🧾 Scan your first receipt to unlock AI insights.';
    }

    double totalSpent = 0;
    final Map<String, double> categoryTotals = {};

    for (final e in expenses) {
      totalSpent += e.totalAmount;
      final catName = e.categoryName ?? 'Other';
      categoryTotals[catName] = (categoryTotals[catName] ?? 0) + e.totalAmount;
    }
    
    // Sort categories by amount
    final sortedCategories = categoryTotals.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    
    String topCategory = 'None';
    if (sortedCategories.isNotEmpty) {
      topCategory = sortedCategories.first.key;
    }

    if (lowerMsg.contains('spend') || lowerMsg.contains('much')) {
      return '''
Hi there! 👋 Here is a quick summary of your spending:

## ₹${totalSpent.toStringAsFixed(2)}
**Total Spent This Month** 📈

**Top Categories:**
${sortedCategories.take(3).map((e) => '- **${e.key}**: ₹${e.value.toStringAsFixed(2)} (${(e.value / totalSpent * 100).toStringAsFixed(1)}%)').join('\n')}

💡 **Saving Tip:** You spent the most on $topCategory. Try setting a specific budget limit for this category to save more next month!
''';
    } else if (lowerMsg.contains('save')) {
      return '''
Here are some personalized tips to help you save! 💰

- **Your biggest expense is $topCategory.** Consider cutting back here.
- Try the 50/30/20 rule: 50% needs, 30% wants, 20% savings.

**Your current top expenses:**
${sortedCategories.take(3).map((e) => '- ${e.key}: ₹${e.value.toStringAsFixed(2)}').join('\n')}
''';
    } else if (lowerMsg.contains('budget')) {
      return '''
📊 **Budget Overview**

You are currently tracking your expenses well!
- Total expenses recorded: **${expenses.length}**
- Total amount spent: **₹${totalSpent.toStringAsFixed(2)}**

Stay consistent with logging your receipts to maintain a healthy budget! ✅
''';
    } else {
      return '''
I can help you analyze your finances! 🤖

Here is a quick glance at your data:
- **Total Spent:** ₹${totalSpent.toStringAsFixed(2)}
- **Transactions:** ${expenses.length}

Try asking me:
- "How much did I spend this month?"
- "Where can I save money?"
''';
    }
  }
}
