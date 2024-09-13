import 'package:apiapp/presentation_layer/commone/navigator_key.dart';
import 'package:flutter/material.dart';

Future<void> showUserImage({required String imageUrl}) async {
  await showDialog(
    context: navigatorKey.currentContext!,
    builder: (context) {
      return Dialog(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      );
    },
  );
}
