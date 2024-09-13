import 'package:apiapp/presentation_layer/app_constanst/app_colors.dart';
import 'package:apiapp/presentation_layer/commone/navigator_key.dart';
import 'package:apiapp/presentation_layer/screens/main_screen/main_screen.dart';
import 'package:apiapp/statemanagemant_layer/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const APIAppRoot(),
  );
}

class APIAppRoot extends StatelessWidget {
  const APIAppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(context: context),
      builder: (context, _) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          home: const MainScreen(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.mainColor,
            ),
          ),
        );
      },
    );
  }
}
