import 'package:advanced_widgets/business/theme_controller.dart';
import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  MyThemeData myThemeData = MyThemeData(
    appBarColor: Colors.white,
    backGroundColor: Colors.white,
    appBarTitleTextColor: Colors.black,
  );

  void changeTheme(
      Color appBarColor, Color backGroundColor, Color appBarTitleTextColor) {
    myThemeData.appBarColor = appBarColor;
    myThemeData.backGroundColor = backGroundColor;
    myThemeData.appBarTitleTextColor = appBarTitleTextColor;
    notifyListeners();
  }
}
