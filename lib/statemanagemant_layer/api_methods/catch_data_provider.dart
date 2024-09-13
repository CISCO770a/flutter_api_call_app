import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:apiapp/data_layer/global_data_list.dart';
import 'package:apiapp/data_layer/name_model.dart';
import 'package:apiapp/data_layer/user_date_of_bearth.dart';
import 'package:apiapp/data_layer/user_images.dart';
import 'package:apiapp/data_layer/user_localtion.dart';
import 'package:apiapp/data_layer/user_location_coordinates.dart';
import 'package:apiapp/data_layer/user_location_street.dart';
import 'package:apiapp/data_layer/user_regester_data_model.dart';
import 'package:apiapp/data_layer/users_model.dart';
import 'package:apiapp/presentation_layer/app_constanst/api_constants.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class CatchDataFromApiProvider with ChangeNotifier {
  bool isLoadding = true;
  bool isInternetError = false;

  Future<void> get fetchUserList async {
    try {
      log("Start Fetching users Data");
      String urlPath = ApiConstants.apiDomain;
      final Uri uri = Uri.parse(urlPath);

      final response = await http.get(uri);

      final String body = response.body;

      final Map<String, dynamic> jsonMap = jsonDecode(body);

      final List<dynamic> dataFromJson = jsonMap["results"];

      final List<UsersDataModel> convertDataList = dataFromJson.map(
        (userData) {
          // Get User Fumm Name
          Map<String, dynamic> userFullName = userData["name"];
          final UserNameModel userName = UserNameModel(
            title: userFullName["title"],
            first: userFullName["first"],
            last: userFullName["last"],
          );

          // Get User Location in detail....

          Map<String, dynamic> userFullLocation = userData["location"];

          Map<String, dynamic> userCoordinates =
              userFullLocation["coordinates"];
          final LocationCoordinatesDataModel coordinates =
              LocationCoordinatesDataModel(
            latitude: userCoordinates["latitude"],
            longitude: userCoordinates["longitude"],
          );

          Map<String, dynamic> userStreetLocation = userFullLocation["street"];

          final LocationStreetDataModel streetInfo = LocationStreetDataModel(
            number: userStreetLocation["number"],
            name: userStreetLocation["name"],
          );

          final UserLocaltionDataModel location = UserLocaltionDataModel(
            city: userFullLocation["city"],
            state: userFullLocation["state"],
            country: userFullLocation["country"],
            postcode: userFullLocation["postcode"].toString(),
            coordinates: coordinates,
            streetInfo: streetInfo,
          );

          // Get User images

          final Map<String, dynamic> images = userData["picture"];

          final UserImagesDataModel userIMages = UserImagesDataModel(
            imagesLarg: images["large"],
            imageMedium: images["medium"],
            thumbnailImage: images["thumbnail"],
          );

          // Get User Date of Bearth

          final Map<String, dynamic> userDateOfBearth = userData["dob"];

          DateTime dateConverted = DateTime.parse(
            userDateOfBearth["date"],
          );

          final UserDateOfBearthDataModel userDOB = UserDateOfBearthDataModel(
            dateOfBearth: dateConverted,
            age: userDateOfBearth["age"],
          );

          // Get User Regester data

          final Map<String, dynamic> userRegester = userData["registered"];

          final DateTime formatedDate = DateTime.parse(
            userRegester["date"],
          );

          final UserRegesterDataModel regesterData = UserRegesterDataModel(
            date: formatedDate,
            age: userRegester["age"],
          );

          // The Data model contains all the data comming from api

          final UsersDataModel user = UsersDataModel(
            gender: userData["gender"],
            email: userData["email"],
            phone: userData["phone"],
            cell: userData["cell"],
            nat: userData["nat"],
            userName: userName,
            location: location,
            images: userIMages,
            dob: userDOB,
            regester: regesterData,
          );
          return user;
        },
      ).toList();

      users = convertDataList;

      isLoadding = false;
      log("Data has been fetched successfully");
      notifyListeners();
    } on SocketException catch (error) {
      isInternetError = true;
      notifyListeners();
      log("no internet conniction :$error");
    } on HttpException catch (error) {
      log("Error on HTTP : $error");
    } catch (error) {
      log("Error: $error");
    }
  }

  // Clear the data comming from API

  void get clearDataList {
    users.clear();
    notifyListeners();
  }

  // Chick if the DataList is empty or not

  bool get isDataEmpty => users.isEmpty;
}
