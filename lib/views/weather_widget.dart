import 'package:advanced_widgets/business/theme_controller.dart';
import 'package:advanced_widgets/views/text_decorator.dart';
import 'package:flutter/material.dart';

import 'weather_painter.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    Key? key,
    required double opacity,
    required AnimationController controller,
    required String weatherInfo,
  })  : _opacity = opacity,
        _controller = controller,
        _weatherInfo = weatherInfo,
        super(key: key);

  final double _opacity;
  final AnimationController _controller;
  final String _weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 100,
              child: CustomPaint(
                painter: WeatherPainter(opacity: _opacity),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 90,
          child: _controller.value == 1
              ? TextDecorator(
                  backgroundColor:
                      ThemeController.of(context).appBarTitleTextColor,
                  frameWidth: 1,
                  child: Text(
                    _weatherInfo,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                )
              : null,
        ),
      ],
    );
  }
}
