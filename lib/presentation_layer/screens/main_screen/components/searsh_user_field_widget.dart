import 'package:apiapp/presentation_layer/app_constanst/app_colors.dart';
import 'package:apiapp/presentation_layer/app_constanst/app_dimensionals.dart';
import 'package:apiapp/statemanagemant_layer/searching_system/search_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchUserFieldWidget extends StatelessWidget {
  const SearchUserFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchUserProvider>(
      builder: (context, search, _) {
        return SizedBox(
          height: context.screenHeight * .07,
          width: context.screenWidth * .97,
          child: TextField(
            controller: search.searchingController,
            keyboardType: TextInputType.text,
            onChanged: (userValue) {
              search.searchUserWithName(
                userName: userValue,
              );
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.mainFillColor,
              hintText: "Search user",
              hintStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 0.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  color: AppColors.mainBorderColor,
                  width: 2.0,
                ),
              ),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        );
      },
    );
  }
}
