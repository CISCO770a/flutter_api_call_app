import 'package:apiapp/presentation_layer/app_constanst/app_colors.dart';
import 'package:apiapp/presentation_layer/app_constanst/app_dimensionals.dart';
import 'package:apiapp/presentation_layer/app_constanst/app_images.dart';
import 'package:apiapp/presentation_layer/screens/main_screen/components/searsh_user_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: context.screenHeight * .05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: context.screenWidth * .17,
                height: context.screenHeight * .05,
                child: SvgPicture.asset(ImagePath.logoImage),
              ),
              SizedBox(
                width: context.screenWidth * .01,
              ),
              const Text(
                "REST API Call",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * .02,
          ),
          const SearchUserFieldWidget(),
        ],
      ),
    );
  }
}
