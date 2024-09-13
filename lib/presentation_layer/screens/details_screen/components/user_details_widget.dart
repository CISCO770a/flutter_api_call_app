import 'package:apiapp/presentation_layer/screens/details_screen/components/user_details_item.dart';
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
