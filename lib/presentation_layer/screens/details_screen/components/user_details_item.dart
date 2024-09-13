import 'package:apiapp/presentation_layer/app_constanst/app_dimensionals.dart';
import 'package:apiapp/presentation_layer/screens/details_screen/user_details_model.dart';
import 'package:flutter/material.dart';

class DetailItemWidget extends StatelessWidget {
  const DetailItemWidget({
    super.key,
    required this.userEmail,
    required this.index,
    this.isLast = false,
  });

  final String userEmail;
  final int index;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          userDetails[index].title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: context.screenHeight * .02,
        ),
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: const Color(0xFF457b9d),
              child: Icon(userDetails[index].icon),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              userEmail,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        if (!isLast) const Divider(),
      ],
    );
  }
}
