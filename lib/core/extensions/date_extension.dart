import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get transaction {
    return DateFormat('d MMM y • HH:mm').format(this);
  }
}
