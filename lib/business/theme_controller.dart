import 'package:flutter/material.dart';

import '../data/model/my_theme_data.dart';

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
