import '../../features/expenses/domain/entities/expense_entity.dart';
import '../extensions/currency_extensions.dart';
import '../extensions/date_extensions.dart';

/// Builds structured Gemini API prompts — ready for Stage 3
class PromptBuilder {
  /// Build a prompt to parse raw OCR text into structured receipt JSON
  static String buildReceiptParsingPrompt(String ocrText) => '''
You are a receipt parser. Extract structured data from the following OCR text from a receipt.

Return ONLY a valid JSON object with exactly these fields (use null for fields you cannot find):
{
  "store_name": string,
  "date": "YYYY-MM-DD",
  "total_amount": number,
  "gst_amount": number | null,
  "receipt_number": string | null,
  "payment_method": "Cash" | "Card" | "UPI" | "Net Banking" | null,
  "category": one of ["Groceries", "Food & Dining", "Transport", "Healthcare", "Shopping", "Utilities", "Entertainment", "Education", "Travel", "Business", "Rent", "Other"],
  "confidence": {
    "store_name": "high" | "medium" | "low",
    "date": "high" | "medium" | "low",
    "total_amount": "high" | "medium" | "low",
    "receipt_number": "high" | "medium" | "low"
  },
  "items": [
    { "name": string, "price": number }
  ]
}

OCR Text:
"""
$ocrText
"""

Return only the JSON, no explanation.
''';

  /// Build a chat prompt with SQLite expense context injected
  static String buildChatPrompt({
    required String userQuery,
    required List<ExpenseEntity> recentExpenses,
    required double monthlyBudget,
    required double monthlySpend,
    required String currencySymbol,
  }) {
    final now = DateTime.now();
    final context = _buildExpenseContext(
      recentExpenses,
      currencySymbol: currencySymbol,
    );

    return '''
You are a smart personal finance assistant integrated into the AI Expense Scanner app.

Current Date: ${now.formatted}
Current Month: ${now.monthYear}
Monthly Budget: ${monthlyBudget.formatted(symbol: currencySymbol)}
Monthly Spend So Far: ${monthlySpend.formatted(symbol: currencySymbol)}
Remaining Budget: ${(monthlyBudget - monthlySpend).formatted(symbol: currencySymbol)}

Recent Expense Data (last 30 days):
$context

User Question: $userQuery

Instructions:
- Answer concisely and helpfully in 2-4 sentences
- Use the provided expense data to answer accurately
- Format currency amounts with $currencySymbol
- If data is insufficient, say so honestly
- Be conversational and friendly
''';
  }

  /// Build a prompt for generating monthly spending insights
  static String buildInsightsPrompt({
    required Map<String, double> categoryTotals,
    required double monthlyBudget,
    required double monthlySpend,
    required String month,
    required String currencySymbol,
  }) {
    final breakdown = categoryTotals.entries
        .map((e) => '${e.key}: ${e.value.formatted(symbol: currencySymbol)}')
        .join('\n');

    return '''
Analyze the following monthly expense breakdown and provide 3 concise financial insights.

Month: $month
Total Budget: ${monthlyBudget.formatted(symbol: currencySymbol)}
Total Spent: ${monthlySpend.formatted(symbol: currencySymbol)}

Category Breakdown:
$breakdown

Provide exactly 3 insights in this JSON format:
{
  "insights": [
    { "type": "warning" | "tip" | "positive", "title": string, "description": string }
  ]
}
''';
  }

  static String _buildExpenseContext(
    List<ExpenseEntity> expenses, {
    required String currencySymbol,
  }) {
    if (expenses.isEmpty) return 'No expenses recorded yet.';

    return expenses
        .take(50) // Limit context size
        .map((e) =>
            '- ${e.date.formatted}: ${e.storeName} | ${e.categoryName ?? 'Uncategorized'} | ${e.totalAmount.formatted(symbol: currencySymbol)}')
        .join('\n');
  }
}
