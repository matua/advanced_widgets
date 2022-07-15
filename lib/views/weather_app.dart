import 'package:advanced_widgets/views/color_picker_widget.dart';
import 'package:advanced_widgets/views/text_decorator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../business/theme_controller.dart';
import '../business/theme_state.dart';
import 'weather_widget.dart';

class WeatherApp extends StatefulWidget {
  WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  double _opacity = 0.6;
  bool _movementDirection = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
                'Weather App',
              )),
              body: Column(children: <Widget>[
                SizedBox(
                  height: 21,
                ),
                TextDecorator(
                  backgroundColor: ThemeController.of(themeControllerContext)
                      .appBarTitleTextColor,
                  frameWidth: 1,
                  child: Text(
                    'Choose theme',
                    style: TextStyle(fontSize: 21),
                  ),
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
                      color: Colors.white,
                      backGroundColor: Colors.white,
                      appBarTitleTextColor: Colors.blue,
                    ),
                    ColorPickerWidget(
                      color: Colors.yellow,
                      backGroundColor: Colors.yellow.shade300,
                      appBarTitleTextColor: Colors.brown,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Builder(builder: (BuildContext context) {
                  return Slider(
                    thumbColor: ThemeController.of(context).backGroundColor,
                    inactiveColor:
                        ThemeController.of(context).appBarTitleTextColor,
                    min: 0.0,
                    max: 1.0,
                    value: _opacity,
                    divisions: 10,
                    onChanged: (double value) {
                      setState(() {
                        _opacity = value;
                      });
                    },
                    activeColor: CupertinoColors.activeGreen,
                  );
                }),
                AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      Matrix4 matrix = Matrix4.identity()
                        ..scale(_controller.value * 1.4 + 1)
                        ..translate(
                            _controller.value * -90, _controller.value * 30);
                      return Transform(
                        transform: matrix,
                        child: GestureDetector(
                          onTap: () {
                            if (_movementDirection) {
                              _controller.forward();
                              _movementDirection = !_movementDirection;
                            } else {
                              _controller.reverse();
                              _movementDirection = !_movementDirection;
                            }
                          },
                          child: WeatherWidget(
                            opacity: _opacity,
                            controller: _controller,
                            weatherInfo: 'Очень солнечно, 31° ',
                          ),
                        ),
                      );
                    })
              ]),
            ));
      })),
    );
  }
}
