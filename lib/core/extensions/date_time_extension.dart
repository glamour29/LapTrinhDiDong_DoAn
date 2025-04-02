import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get yearMonthDay =>
      DateFormat(DateFormat.YEAR_MONTH_DAY).format(this);
}
