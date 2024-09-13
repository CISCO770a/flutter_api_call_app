import 'package:apiapp/presentation_layer/app_constanst/app_dimensionals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataCommingFromApiScreen extends StatelessWidget {
  const NoDataCommingFromApiScreen({
    super.key,
    required this.descriptionText,
    required this.imagePath,
  });

  final String descriptionText;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: context.screenHeight * .3,
            width: context.screenWidth * .7,
            child: SvgPicture.asset(
              imagePath,
            ),
          ),
          SizedBox(
            height: context.screenHeight * .08,
          ),
           Text(
            descriptionText,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
