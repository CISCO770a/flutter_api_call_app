import 'package:apiapp/data_layer/users_model.dart';
import 'package:apiapp/presentation_layer/app_constanst/app_dimensionals.dart';
import 'package:apiapp/presentation_layer/app_constanst/app_fonts.dart';
import 'package:apiapp/presentation_layer/commone/navigate_to.dart';
import 'package:apiapp/presentation_layer/screens/details_screen/main_details_screen.dart';
import 'package:apiapp/presentation_layer/screens/main_screen/components/show_user_image.dart';
import 'package:apiapp/statemanagemant_layer/api_methods/format_date.dart';
import 'package:flutter/material.dart';

class UserItemWidget extends StatefulWidget {
  const UserItemWidget({
    super.key,
    required this.userData,
  });
  final UsersDataModel userData;

  @override
  State<UserItemWidget> createState() => _UserItemWidgetState();
}

class _UserItemWidgetState extends State<UserItemWidget> {
  String regesterDate = "";
  late Color genderColor;

  void get getGenderColor {
    bool isMale = widget.userData.gender == "male";

    if (isMale) {
      setState(
        () {
          genderColor = Colors.blue;
        },
      );
      return;
    }

    genderColor = Colors.pink;
  }

  // Get Formated Date
  void get formatRegesterDate {
    String dateFormated = formatedDate(
      date: widget.userData.regester.date,
    );

    setState(
      () {
        regesterDate = dateFormated;
      },
    );
  }

  @override
  void initState() {
    formatRegesterDate;
    getGenderColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 10.0,
      ),
      margin: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 10.0,
      ),
      child: InkWell(
        onTap: () {
          navigateTo(
            root: MainDetailsScreen(userData: widget.userData),
          );
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: widget.userData.phone,
                    child: GestureDetector(
                      onTap: () {
                        showUserImage(
                          imageUrl: widget.userData.images.imageMedium,
                        );
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                          widget.userData.images.imageMedium,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: context.screenWidth * .71,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: context.screenWidth * .4,
                              alignment: Alignment.centerLeft,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  widget.userData.userName.userFullName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: context.screenWidth * .1,
                            ),
                            Text(
                              regesterDate,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF9e9e9e),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        alignment: Alignment.centerLeft,
                        width: context.screenWidth * .17,
                        decoration: BoxDecoration(
                          color: genderColor.withOpacity(0.1),
                          border: Border.all(
                            color: genderColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          widget.userData.gender.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.normalFont,
                          ),
                        ),
                      ),
                      Text.rich(
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: "${widget.userData.location.country} - ",
                            ),
                            TextSpan(
                              text: widget.userData.location.city,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: context.screenHeight * .0,
              child: Container(
                height: context.screenHeight * .05,
                width: context.screenWidth * .1,
                decoration: const BoxDecoration(
                  color: Color(0xFF004e89),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30.0),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
