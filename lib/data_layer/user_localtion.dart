import 'package:apiapp/data_layer/user_location_coordinates.dart';
import 'package:apiapp/data_layer/user_location_street.dart';

class UserLocaltionDataModel {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationCoordinatesDataModel coordinates;
  final LocationStreetDataModel streetInfo;

  UserLocaltionDataModel({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.streetInfo,
  });

  String get userFullLocation {
    final String fulllocation = "$city $state, $country";

    return fulllocation;
  }
}
