import 'package:apiapp/presentation_layer/app_constanst/app_dimensionals.dart';
import 'package:apiapp/statemanagemant_layer/api_methods/catch_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiCallButtonWidget extends StatelessWidget {
  const ApiCallButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Consumer<CatchDataFromApiProvider>(
            builder: (context, catchData, _) {
              return GestureDetector(
                onTap: () {
                  catchData.clearDataList;
                  catchData.isInternetError = false;
                },
                child: const CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.delete),
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: context.screenWidth * .05,
        ),
        Align(
          alignment: Alignment.center,
          child: Consumer<CatchDataFromApiProvider>(
            builder: (context, apiData, _) {
              return SizedBox(
                width: context.screenWidth * .5,
                height: context.screenHeight * .08,
                child: MaterialButton(
                  onPressed: () {
                    apiData.fetchUserList;
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: const Color(0xFF3a506b),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.connect_without_contact_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "API Call",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
