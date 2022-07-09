import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business/theme_state.dart';

class ColorPickerWidget extends StatelessWidget {
  ColorPickerWidget({
    Key? key,
    required this.color,
    required this.backGroundColor,
    required this.appBarTitleTextColor,
  }) : super(key: key);
  final Color color;
  final Color backGroundColor;
  final Color appBarTitleTextColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context
            .read<ThemeState>()
            .changeTheme(color, backGroundColor, appBarTitleTextColor),
        child: SizedBox(
          height: 50,
          width: 50,
          child: Container(
            decoration: BoxDecoration(
                color: color, border: Border.all(color: Colors.black)),
          ),
        ));
  }
}
