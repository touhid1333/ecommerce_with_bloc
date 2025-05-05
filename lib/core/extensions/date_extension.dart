import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String _defaultFormat = 'dd MMMM, yyyy';

extension DateTimeExtension on DateTime {
  String format([
    String pattern = _defaultFormat,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  bool isSameDate(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }
}
