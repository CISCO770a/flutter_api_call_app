import 'package:intl/intl.dart';

String formatedDate({
  required DateTime date,
}) {
  String format = "d MMM, yyyy";
  String dateFormated = DateFormat(format).format(date);
  return dateFormated;
}
