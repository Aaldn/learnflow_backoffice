import 'package:intl/intl.dart';

extension FormatDateTime on DateTime {
  String get formatFr => DateFormat.MMM("fr_FR").format(this);
}
