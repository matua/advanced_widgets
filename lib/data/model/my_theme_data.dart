import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_theme_data.freezed.dart';

@unfreezed
class MyThemeData with _$MyThemeData {
  factory MyThemeData({
    required Color? appBarColor,
    required Color? backGroundColor,
    required Color? appBarTitleTextColor,
  }) = _MyThemeData;
}
