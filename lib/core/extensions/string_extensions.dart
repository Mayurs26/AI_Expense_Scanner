extension StringExtensions on String {
  /// Capitalize first letter
  String get capitalized =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  /// Title case: "hello world" → "Hello World"
  String get titleCase => split(' ').map((w) => w.capitalized).join(' ');

  /// Truncate with ellipsis
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength - ellipsis.length)}$ellipsis';
  }

  /// Extract tags from string: "#work, #travel" → ["work", "travel"]
  List<String> get parsedTags {
    if (isEmpty) return [];
    return split(',')
        .map((t) => t.trim().replaceAll('#', '').toLowerCase())
        .where((t) => t.isNotEmpty)
        .toList();
  }

  /// Format tags for storage: ["work", "travel"] → "#work,#travel"
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  /// Check if string is a valid number
  bool get isNumeric => double.tryParse(this) != null;

  /// Parse as double safely
  double get asDouble => double.tryParse(this) ?? 0.0;

  /// Remove all whitespace
  String get trimAll => replaceAll(RegExp(r'\s+'), ' ').trim();

  /// Check if null or empty
  bool get isBlank => trim().isEmpty;

  /// Returns null if blank, otherwise returns self
  String? get nullIfBlank => isBlank ? null : this;
}

extension StringListExtensions on List<String> {
  /// Join tags for storage
  String get toTagString => map((t) => '#$t').join(',');
}

extension NullableStringExtensions on String? {
  bool get isNullOrBlank => this == null || this!.isBlank;
  String get orEmpty => this ?? '';
}
