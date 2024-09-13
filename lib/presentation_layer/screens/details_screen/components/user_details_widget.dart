import 'package:apiapp/presentation_layer/app_constanst/app_dimensionals.dart';
import 'package:apiapp/presentation_layer/screens/details_screen/user_details_model.dart';
import 'package:flutter/material.dart';

class UserDetailsItemWidget extends StatelessWidget {
  const UserDetailsItemWidget({
    super.key,
    required this.userEmail,
    required this.userAddress,
    required this.regestration,
    required this.dOB,
    required this.nat,
  });

  final String userEmail;
  final String userAddress;
  final String regestration;
  final String dOB;
  final String nat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          DetailItemWidget(
            userEmail: userEmail,
            index: 0,
          ),
          DetailItemWidget(
            userEmail: userAddress,
            index: 1,
          ),
          DetailItemWidget(
            userEmail: regestration,
            index: 2,
          ),
          DetailItemWidget(
            userEmail: dOB,
            index: 3,
          ),
          DetailItemWidget(
            userEmail: nat,
            index: 4,
            isLast: true,
          ),
        ],
      ),
    );
  }
}

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
