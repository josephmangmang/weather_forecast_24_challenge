import 'package:intl/intl.dart';

final _defaultDateFormat = DateFormat('dd/MM/yyyy');

extension DateTimeExtension on DateTime {
  String toReadableDate() {
    return _defaultDateFormat.format(this);
  }
}
