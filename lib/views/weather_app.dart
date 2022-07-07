import 'package:advanced_widgets/views/color_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business/theme_controller.dart';
import '../business/theme_state.dart';

class WeatherApp extends StatefulWidget {
  WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  late Brightness brightness;

  @override
  Widget build(BuildContext context) {
    print('BUILD');
    return ThemeController(
      myThemeData: context.watch<ThemeState>().myThemeData,
      child: SizedBox(
          child: Builder(builder: (BuildContext themeControllerContext) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: ThemeController.of(themeControllerContext)
                          .appBarTitleTextColor),
                  backgroundColor:
                      ThemeController.of(themeControllerContext).appBarColor),
              scaffoldBackgroundColor:
                  ThemeController.of(themeControllerContext).backGroundColor,
            ),
            home: Scaffold(
                appBar: AppBar(
                    title: Text(
                  'test',
                )),
                body: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 21,
                    ),
                    Text(
                      'Choose theme',
                      style: TextStyle(fontSize: 21),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ColorPickerWidget(
                          color: Colors.brown,
                          backGroundColor: Colors.brown.shade300,
                          appBarTitleTextColor: Colors.yellow,
                        ),
                        ColorPickerWidget(
                          color: Colors.blue,
                          backGroundColor: Colors.blue.shade300,
                          appBarTitleTextColor: Colors.orange,
                        ),
                        ColorPickerWidget(
                          color: Colors.green,
                          backGroundColor: Colors.green.shade300,
                          appBarTitleTextColor: Colors.white,
                        ),
                        ColorPickerWidget(
                          color: Colors.orange,
                          backGroundColor: Colors.orange.shade300,
                          appBarTitleTextColor: Colors.blue,
                        ),
                        ColorPickerWidget(
                          color: Colors.yellow,
                          backGroundColor: Colors.yellow.shade300,
                          appBarTitleTextColor: Colors.brown,
                        ),
                      ],
                    ),
                  ],
                )));
      })),
    );
  }
}
