import 'package:apiapp/data_layer/name_model.dart';
import 'package:apiapp/data_layer/user_date_of_bearth.dart';
import 'package:apiapp/data_layer/user_images.dart';
import 'package:apiapp/data_layer/user_localtion.dart';
import 'package:apiapp/data_layer/user_regester_data_model.dart';

class UsersDataModel {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserNameModel userName;
  final UserLocaltionDataModel location;
  final UserImagesDataModel images;
  final UserDateOfBearthDataModel dob;
  final UserRegesterDataModel regester;
  const UsersDataModel({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.userName,
    required this.location,
    required this.images,
    required this.dob,
    required this.regester,
  });
}
