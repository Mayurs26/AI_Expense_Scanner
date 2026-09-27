import 'package:intl/intl.dart';

extension CurrencyExtensions on double {
  /// Format with currency symbol from settings (default ₹)
  String formatted({String symbol = '₹', int decimalDigits = 2}) {
    final formatter = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: decimalDigits,
      locale: 'en_IN',
    );
    return formatter.format(this);
  }

  /// Compact format: ₹1.2K, ₹1.2M
  String compact({String symbol = '₹'}) {
    if (this >= 1000000) {
      return '$symbol${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 1000) {
      return '$symbol${(this / 1000).toStringAsFixed(1)}K';
    }
    return formatted(symbol: symbol);
  }

  /// Returns percentage string: "42.5%"
  String get asPercentage => '${toStringAsFixed(1)}%';

  /// Absolute value
  double get abs => this < 0 ? -this : this;
}

extension IntCurrencyExtensions on int {
  String formatted({String symbol = '₹'}) => toDouble().formatted(symbol: symbol);
  String compact({String symbol = '₹'}) => toDouble().compact(symbol: symbol);
}

/// Supported currencies
enum SupportedCurrency {
  inr('₹', 'INR', 'Indian Rupee'),
  usd('\$', 'USD', 'US Dollar'),
  eur('€', 'EUR', 'Euro'),
  gbp('£', 'GBP', 'British Pound'),
  jpy('¥', 'JPY', 'Japanese Yen'),
  cad('CA\$', 'CAD', 'Canadian Dollar'),
  aud('A\$', 'AUD', 'Australian Dollar'),
  sgd('S\$', 'SGD', 'Singapore Dollar'),
  aed('د.إ', 'AED', 'UAE Dirham');

  const SupportedCurrency(this.symbol, this.code, this.label);
  final String symbol;
  final String code;
  final String label;
}
