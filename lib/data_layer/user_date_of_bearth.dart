import 'package:apiapp/statemanagemant_layer/api_methods/format_date.dart';

class UserDateOfBearthDataModel {
  final DateTime dateOfBearth;
  final int age;

  UserDateOfBearthDataModel({
    required this.dateOfBearth,
    required this.age,
  });

  String get getDateOfBearth {
    String formatDate = formatedDate(date: dateOfBearth);
    String data = "$formatDate ($age years old)";
    return data;
  }
}
