class UserNameModel {
  final String title;
  final String first;
  final String last;

  UserNameModel({
    required this.title,
    required this.first,
    required this.last,
  });

  String get userFullName {
    String fullName = "$first $last";
    return fullName;
  }
}
