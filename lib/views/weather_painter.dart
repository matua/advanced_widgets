import 'dart:math';

import 'package:flutter/material.dart';

class WeatherPainter extends CustomPainter {
  WeatherPainter({
    required this.opacity,
  });

  double opacity;

  double _getDropsAndGrayCloudOpacity(double opacity) {
    if (opacity < 0.7) {
      return 0;
    }
    return 10 / 3 * opacity - 7 / 3;
  }

  double _getSunOpacity(double opacity) {
    if (opacity >= 0.7) {
      return 0;
    }
    return 1;
  }

  double _getCloudOpacity(double opacity) {
    if (opacity < 0.3 || opacity > 0.7) {
      return 0;
    } else if (opacity == 0.3) {
      return 0.2;
    } else if (opacity == 0.4) {
      return 0.4;
    } else if (opacity == 0.5) {
      return 0.6;
    } else if (opacity == 0.6) {
      return 1;
    } else {
      return 1;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint sun = Paint()
      ..color = Colors.amber.withOpacity(_getSunOpacity(opacity));

    canvas.drawCircle(Offset(size.width / 2, size.height / 2 + 15), 75, sun);

    final Paint cloud = Paint()
      ..color =
          Colors.lightBlueAccent.shade100.withOpacity(_getCloudOpacity(opacity))
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;

    final Paint grayCloud = Paint()
      ..color = Colors.grey.withOpacity(_getDropsAndGrayCloudOpacity(opacity))
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;

    final Paint drop1 = Paint()
      ..color = Color.fromRGBO(97, 92, 154, 255)
          .withOpacity(_getDropsAndGrayCloudOpacity(opacity))
      ..style = PaintingStyle.fill;
    final Paint drop2 = Paint()
      ..color = Color.fromRGBO(156, 164, 180, 255)
          .withOpacity(_getDropsAndGrayCloudOpacity(opacity))
      ..style = PaintingStyle.fill;
    final Paint drop3 = Paint()
      ..color = Color.fromRGBO(152, 193, 215, 255)
          .withOpacity(_getDropsAndGrayCloudOpacity(opacity))
      ..style = PaintingStyle.fill;

    final Path cloudPath = Path()
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width / 2 - 40, size.height / 2 + 85),
              radius: 50),
          degreesToRadians(180),
          degreesToRadians(350),
          true)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width / 2 + 50, size.height / 2 + 60),
              radius: 75),
          degreesToRadians(180),
          degreesToRadians(350),
          true)
      ..addRect(
          Rect.fromCenter(center: Offset(205, 210), width: 98, height: 50))
      ..close();

    canvas.drawPath(cloudPath, cloud);

    final Path grayCloudPath = Path()
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width / 2 - 40, size.height / 2 + 85),
              radius: 50),
          degreesToRadians(180),
          degreesToRadians(350),
          true)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width / 2 + 50, size.height / 2 + 60),
              radius: 75),
          degreesToRadians(180),
          degreesToRadians(350),
          true)
      ..addRect(
          Rect.fromCenter(center: Offset(205, 210), width: 98, height: 50))
      ..close();

    canvas.drawPath(grayCloudPath, grayCloud);

    final Path rainDrop1Path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(size.width / 2 - 30, size.height / 2 + 120),
              width: 21,
              height: 50),
          Radius.circular(10)));

    final Path rainDrop2Path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(size.width / 2 + 10, size.height / 2 + 120),
              width: 21,
              height: 35),
          Radius.circular(10)));

    final Path rainDrop3Path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(size.width / 2 + 45, size.height / 2 + 130),
              width: 21,
              height: 60),
          Radius.circular(10)));

    final Path rainDrop2Path2 = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(size.width / 2 - 10, size.height / 2 + 170),
              width: 21,
              height: 45),
          Radius.circular(10)));

    canvas.drawPath(rainDrop1Path, drop1);
    canvas.drawPath(rainDrop2Path, drop2);
    canvas.drawPath(rainDrop3Path, drop3);
    canvas.drawPath(rainDrop2Path2, drop2);
  }

  @override
  bool shouldRepaint(WeatherPainter oldDelegate) {
    return opacity != oldDelegate.opacity;
  }

  double degreesToRadians(double degrees) {
    return (degrees * pi) / 180;
  }
}
