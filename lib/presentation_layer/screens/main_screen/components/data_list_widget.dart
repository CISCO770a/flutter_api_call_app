import 'package:apiapp/data_layer/global_data_list.dart';
import 'package:apiapp/data_layer/users_model.dart';
import 'package:apiapp/presentation_layer/app_constanst/app_dimensionals.dart';
import 'package:apiapp/presentation_layer/app_constanst/app_images.dart';
import 'package:apiapp/presentation_layer/screens/main_screen/components/custom_app_bar.dart';
import 'package:apiapp/presentation_layer/screens/main_screen/components/user_item_widget.dart';
import 'package:apiapp/presentation_layer/screens/other_screen/no_data_screen.dart';
import 'package:apiapp/statemanagemant_layer/api_methods/catch_data_provider.dart';
import 'package:apiapp/statemanagemant_layer/searching_system/search_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataListWidget extends StatefulWidget {
  const DataListWidget({super.key});

  @override
  State<DataListWidget> createState() => _DataListWidgetState();
}

class _DataListWidgetState extends State<DataListWidget> {
  late final CatchDataFromApiProvider catchData;
  @override
  void initState() {
    catchData = Provider.of<CatchDataFromApiProvider>(context, listen: false);
    catchData.fetchUserList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
          FocusNode(),
        );
      },
      child: Consumer<SearchUserProvider>(
        builder: (context, search, _) {
          bool isUserSearching = search.isUserSearching;
          return Consumer<CatchDataFromApiProvider>(
            builder: (context, catchData, _) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  catchData.isInternetError
                      ? const NoDataCommingFromApiScreen(
                          descriptionText: "Check the internet connection",
                          imagePath: ImagePath.internetConnectionError,
                        )
                      : catchData.isLoadding
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Positioned(
                              top: context.screenHeight * .21,
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: search.isUsersNotFound
                                  ? NoDataCommingFromApiScreen(
                                      descriptionText: "User not \"${search.searchingController.text}\" found in users",
                                      imagePath: ImagePath.noDataImage,
                                    )
                                  : ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return Divider(
                                          indent: context.screenWidth * .25,
                                        );
                                      },
                                      padding: EdgeInsets.only(
                                        top: context.screenHeight * .02,
                                      ),
                                      itemCount: isUserSearching
                                          ? filterUsers.length
                                          : users.length,
                                      itemBuilder: (context, index) {
                                        final UsersDataModel singleUser =
                                            isUserSearching
                                                ? filterUsers[index]
                                                : users[index];
                                        return UserItemWidget(
                                          userData: singleUser,
                                        );
                                      },
                                    ),
                            ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: CustomAppBarWidget(),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
