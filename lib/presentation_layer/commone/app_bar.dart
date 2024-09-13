import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.appBarHeight,
    required this.title,
    required this.appBarColor,
  });

  final double appBarHeight;
  final String title;
  final Color appBarColor;

  @override
  Size get preferredSize {
    Size appBarSize = Size(double.infinity, appBarHeight);
    return appBarSize;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor,
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
