import 'package:flutter/material.dart';

class ThemeController extends InheritedWidget {
  const ThemeController({
    Key? key,
    required this.myThemeData,
    required Widget child,
  }) : super(key: key, child: child);

  final MyThemeData myThemeData;

  static MyThemeData of(BuildContext context) {
    final ThemeController? myTextTheme =
        context.dependOnInheritedWidgetOfExactType<ThemeController>();
    return myTextTheme!.myThemeData;
  }

  @override
  bool updateShouldNotify(ThemeController oldWidget) =>
      myThemeData != oldWidget.myThemeData;
}

class MyThemeData {
  MyThemeData({
    required this.appBarColor,
    required this.backGroundColor,
    required this.appBarTitleTextColor,
  });

  Color? appBarColor;
  Color? backGroundColor;
  Color? appBarTitleTextColor;
}
