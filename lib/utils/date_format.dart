import 'package:intl/intl.dart';

extension FormatDateTime on DateTime {
  String get formatFr => DateFormat.yMd("fr_FR").format(this);
}
