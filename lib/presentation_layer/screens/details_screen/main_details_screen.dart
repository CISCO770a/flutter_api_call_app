import 'package:apiapp/data_layer/users_model.dart';
import 'package:apiapp/presentation_layer/app_constanst/app_dimensionals.dart';
import 'package:apiapp/presentation_layer/screens/details_screen/components/user_details_widget.dart';
import 'package:flutter/material.dart';

class MainDetailsScreen extends StatelessWidget {
  const MainDetailsScreen({
    super.key,
    required this.userData,
  });

  final UsersDataModel userData;

  @override
  Widget build(BuildContext context) {
    double containerHeight = context.screenHeight * .18;
    return Scaffold(
      backgroundColor: const Color(0xFFdae5eb),
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: containerHeight,
              decoration: const BoxDecoration(
                color: Color(0xFF457b9d),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: context.screenHeight * .04,
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: context.screenWidth * .04,
                      ),
                      const Text(
                        "User Details",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: context.screenHeight * .13,
            right: 0,
            left: 0,
            child: Hero(
              tag: userData.phone,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: const Color(0xFF457b9d),
                child: ClipOval(
                  child: Image.network(
                    userData.images.imageMedium,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: context.screenHeight * .25,
            left: 0,
            right: 0,
            child: UserInforamtionWidget(
              userData: userData,
            ),
          )
        ],
      ),
    );
  }
}

class UserInforamtionWidget extends StatefulWidget {
  const UserInforamtionWidget({
    super.key,
    required this.userData,
  });

  final UsersDataModel userData;

  @override
  State<UserInforamtionWidget> createState() => _UserInforamtionWidgetState();
}

class _UserInforamtionWidgetState extends State<UserInforamtionWidget> {
  late String userName;
  late String userPhone;
  late String userCountry;
  late String userAddress;
  late String userLocation;
  late String userEmail;
  late String dateOfBearth;
  late String rejesterData;
  late String nationality;

  void get getUserName {
    setState(
      () {
        userName = widget.userData.userName.userFullName;
      },
    );
  }

  void get getUserPhone {
    setState(
      () {
        userPhone = widget.userData.phone;
      },
    );
  }

  void get getUserAddress {
    setState(
      () {
        userAddress = widget.userData.location.streetInfo.userStreetInfo;
      },
    );
  }

  void get userLocationData {
    setState(
      () {
        userCountry = widget.userData.location.userFullLocation;
      },
    );
  }

  void get userEmailData {
    setState(
      () {
        userEmail = widget.userData.email;
      },
    );
  }

  void get userNat {
    setState(() {
      nationality = widget.userData.nat;
    });
  }

  void get getRegestrationData {
    setState(
      () {
        rejesterData = widget.userData.regester.getUserRegestrationData;
      },
    );
  }

  void get getDateOfBearth {
    setState(
      () {
        dateOfBearth = widget.userData.dob.getDateOfBearth;
      },
    );
  }

  void get setUserData {
    userNat;
    getUserName;
    getUserPhone;
    userEmailData;
    getUserAddress;
    getDateOfBearth;
    userLocationData;
    getRegestrationData;
  }

  @override
  initState() {
    setUserData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(
            userName,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF457b9d),
            ),
          ),
          Text(
            userPhone,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF6c757d),
            ),
          ),
          UserDetailsItemWidget(
            userEmail: userEmail,
            userAddress: userAddress,
            regestration: rejesterData,
            dOB: dateOfBearth,
            nat: nationality,
          ),
        ],
      ),
    );
  }
}
