import 'package:flutter/material.dart';

import '../data/model/my_theme_data.dart';

class ThemeState extends ChangeNotifier {
  MyThemeData myThemeData = MyThemeData(
    appBarColor: Colors.white,
    backGroundColor: Colors.white,
    appBarTitleTextColor: Colors.black,
  );

  void changeTheme(
      Color appBarColor, Color backGroundColor, Color appBarTitleTextColor) {
    MyThemeData newMyThemeData = myThemeData.copyWith(
        appBarColor: appBarColor,
        backGroundColor: backGroundColor,
        appBarTitleTextColor: appBarTitleTextColor);
    if (newMyThemeData != myThemeData) {
      myThemeData = newMyThemeData;
      notifyListeners();
    }
  }
}
