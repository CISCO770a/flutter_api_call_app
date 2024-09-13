import 'package:apiapp/presentation_layer/app_constanst/app_colors.dart';
import 'package:apiapp/presentation_layer/app_constanst/app_dimensionals.dart';
import 'package:apiapp/statemanagemant_layer/api_methods/catch_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiCallButtonWidget extends StatelessWidget {
  const ApiCallButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Consumer<CatchDataFromApiProvider>(
            builder: (context, apiData, _) {
              return SizedBox(
                width: context.screenWidth * .5,
                height: context.screenHeight * .08,
                child: MaterialButton(
                  onPressed: () {
                    apiData.isInternetError = false;
                    apiData.fetchUserList;
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: AppColors.mainColor,
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
