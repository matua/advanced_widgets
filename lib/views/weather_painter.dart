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
    final Paint sunPaint = Paint()
      ..color = Colors.amber.withOpacity(_getSunOpacity(opacity));

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 35, sunPaint);

    final Paint cloudPaint = Paint()
      ..color =
          Colors.lightBlueAccent.shade100.withOpacity(_getCloudOpacity(opacity))
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;

    final Paint grayCloudPaint = Paint()
      ..color = Colors.grey.withOpacity(_getDropsAndGrayCloudOpacity(opacity))
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;

    final Paint drop1Paint = Paint()
      ..color = Color.fromRGBO(97, 92, 154, 255)
          .withOpacity(_getDropsAndGrayCloudOpacity(opacity))
      ..style = PaintingStyle.fill;
    final Paint drop2Paint = Paint()
      ..color = Color.fromRGBO(156, 164, 180, 255)
          .withOpacity(_getDropsAndGrayCloudOpacity(opacity))
      ..style = PaintingStyle.fill;
    final Paint drop3Paint = Paint()
      ..color = Color.fromRGBO(152, 193, 215, 255)
          .withOpacity(_getDropsAndGrayCloudOpacity(opacity))
      ..style = PaintingStyle.fill;

    final Path cloudPath = Path()
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - 95, size.height / 2 + 25),
              radius: 25),
          degreesToRadians(180),
          degreesToRadians(350),
          true)..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - 55, size.height / 2 + 15),
              radius: 35),
          degreesToRadians(180),
          degreesToRadians(350),
          true)
      ..addRect(Rect.fromCenter(center: Offset(125, 85), width: 40, height: 30))
      ..close();

    canvas.drawPath(cloudPath, cloudPaint);

    final Path grayCloudPath = Path()
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - 95, size.height / 2 + 25),
              radius: 25),
          degreesToRadians(180),
          degreesToRadians(350),
          true)..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - 55, size.height / 2 + 15),
              radius: 35),
          degreesToRadians(180),
          degreesToRadians(350),
          true)
      ..addRect(Rect.fromCenter(center: Offset(125, 85), width: 40, height: 30))
      ..close();

    canvas.drawPath(grayCloudPath, grayCloudPaint);

    final Path rainDrop1Path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(size.width - 90, size.height / 2 + 45),
              width: 10,
              height: 25),
          Radius.circular(10)));

    final Path rainDrop2Path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(size.width - 70, size.height / 2 + 45),
              width: 10,
              height: 18),
          Radius.circular(10)));

    final Path rainDrop3Path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(size.width - 50, size.height / 2 + 45),
              width: 10,
              height: 30),
          Radius.circular(10)));

    final Path rainDrop2Path2 = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(size.width - 80, size.height / 2 + 70),
              width: 10,
              height: 23),
          Radius.circular(10)));

    canvas.drawPath(rainDrop1Path, drop1Paint);
    canvas.drawPath(rainDrop2Path, drop2Paint);
    canvas.drawPath(rainDrop3Path, drop3Paint);
    canvas.drawPath(rainDrop2Path2, drop2Paint);
  }

  @override
  bool shouldRepaint(WeatherPainter oldDelegate) {
    return opacity != oldDelegate.opacity;
  }

  double degreesToRadians(double degrees) {
    return (degrees * pi) / 180;
  }
}
