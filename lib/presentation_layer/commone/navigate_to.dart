import 'package:apiapp/presentation_layer/commone/navigator_key.dart';
import 'package:flutter/material.dart';

void navigateTo({
  required Widget root,
}) {
  Navigator.of(navigatorKey.currentContext!).push(
    MaterialPageRoute(
      builder: (context) {
        return root;
      },
    ),
  );
}
