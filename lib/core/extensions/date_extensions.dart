import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  /// Format: "26 Sep 2026"
  String get formatted => DateFormat('dd MMM yyyy').format(this);

  /// Format: "Sep 26"
  String get shortFormatted => DateFormat('MMM dd').format(this);

  /// Format: "September 2026"
  String get monthYear => DateFormat('MMMM yyyy').format(this);

  /// Format: "Mon"
  String get shortDay => DateFormat('EEE').format(this);

  /// Format: "2026-09-26"
  String get isoDate => DateFormat('yyyy-MM-dd').format(this);

  /// Format: "26 Sep, 9:00 AM"
  String get dateTimeFormatted =>
      DateFormat('dd MMM, h:mm a').format(this);

  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  bool get isThisMonth {
    final now = DateTime.now();
    return year == now.year && month == now.month;
  }

  /// Returns "Today", "Yesterday", or formatted date
  String get relativeDate {
    if (isToday) return 'Today';
    if (isYesterday) return 'Yesterday';
    return formatted;
  }

  /// Start of the current month
  DateTime get startOfMonth => DateTime(year, month, 1);

  /// End of the current month
  DateTime get endOfMonth => DateTime(year, month + 1, 0, 23, 59, 59);

  /// Days since epoch (for streak calculation)
  int get daysSinceEpoch =>
      DateTime(year, month, day).difference(DateTime(1970, 1, 1)).inDays;
}

extension NullableDateTimeExtensions on DateTime? {
  String get formattedOrEmpty => this?.formatted ?? '';
}
