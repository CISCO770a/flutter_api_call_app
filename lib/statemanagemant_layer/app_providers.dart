import 'package:apiapp/statemanagemant_layer/api_methods/catch_data_provider.dart';
import 'package:apiapp/statemanagemant_layer/searching_system/search_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers({required BuildContext context}) {
  List<SingleChildWidget> appProviders = <SingleChildWidget>[
    ChangeNotifierProvider(
      create: (context) {
        return CatchDataFromApiProvider();
      },
    ),
    ChangeNotifierProvider(
      create: (context) {
        return SearchUserProvider();
      },
    ),
  ];

  return appProviders;
}
