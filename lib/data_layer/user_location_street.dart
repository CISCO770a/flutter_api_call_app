class LocationStreetDataModel {
  final int number;
  final String name;

  LocationStreetDataModel({
    required this.number,
    required this.name,
  });

  String get userStreetInfo {
    final String userStreet = "$number, $name";

    return userStreet;
  }
}
