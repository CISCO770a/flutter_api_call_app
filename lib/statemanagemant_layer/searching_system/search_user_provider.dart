import 'package:apiapp/data_layer/global_data_list.dart';
import 'package:flutter/material.dart';

class SearchUserProvider with ChangeNotifier {
  final TextEditingController searchingController = TextEditingController();
  void searchUserWithName({
    required String userName,
  }) {
    filterUsers = users.where(
      (user) {
        return user.userName.userFullName.toLowerCase().contains(
              userName.toLowerCase(),
            );
      },
    ).toList();

    notifyListeners();
  }

  bool get isUserSearching {
    String textFeildText = searchingController.text;

    bool isTextFeilNotEmpty = textFeildText.isNotEmpty;

    return isTextFeilNotEmpty;
  }

  bool get isUsersNotFound {
    bool isFound = filterUsers.isEmpty;

    return isFound;
  }

  bool get isSearchingMode {
    bool isSearching = isUserSearching && isUsersNotFound;

    return isSearching;
  }
}
