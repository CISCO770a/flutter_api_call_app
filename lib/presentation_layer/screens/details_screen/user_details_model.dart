import 'package:flutter/material.dart';

class UserDetailsDataModel {
  final IconData icon;
  final String title;

  UserDetailsDataModel({
    required this.icon,
    required this.title,
  });
}

List<UserDetailsDataModel> userDetails = <UserDetailsDataModel>[
  UserDetailsDataModel(
    icon: Icons.email,
    title: "Email",
  ),
  UserDetailsDataModel(
    icon: Icons.location_on_sharp,
    title: "Address",
  ),
  UserDetailsDataModel(
    icon: Icons.info,
    title: "Regestration Info",
  ),
  UserDetailsDataModel(
    icon: Icons.child_friendly_sharp,
    title: "Date of bearth",
  ),
  UserDetailsDataModel(
    icon: Icons.flag,
    title: "Nationality",
  ),
];
