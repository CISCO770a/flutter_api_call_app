import 'package:apiapp/statemanagemant_layer/api_methods/format_date.dart';

class UserRegesterDataModel {
  final DateTime date;
  final int age;

  UserRegesterDataModel({
    required this.date,
    required this.age,
  });

  String get getUserRegestrationData {
    String formatedDete  =formatedDate(date: date);
    String data = "$formatedDete (since: $age)";
    return data;
  }
}
