import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class TextDecorator extends SingleChildRenderObjectWidget {
  TextDecorator(
      {Key? key,
      required this.backgroundColor,
      required this.frameWidth,
      Widget? child})
      : super(key: key, child: child);

  final Color? backgroundColor;
  final double frameWidth;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderTextDecorator(
      background: backgroundColor!,
      frameWidth: frameWidth,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    renderObject as _RenderTextDecorator
      ..backgroundColor = backgroundColor!
      ..frameWidth = frameWidth;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('background', backgroundColor));
    properties.add(DoubleProperty('frameWidth', frameWidth));
  }
}

class _RenderTextDecorator extends RenderProxyBox {
  _RenderTextDecorator({required Color background, required double frameWidth})
      : _backgroundColor = background,
        _frameWidth = frameWidth;

  Color _backgroundColor;
  double _frameWidth;

  set backgroundColor(Color value) {
    if (value == _backgroundColor) {
      return;
    }
    _backgroundColor = value;
    markNeedsPaint();
  }

  set frameWidth(double value) {
    if (value == _frameWidth || value < 0 || value > 10) {
      return;
    }
    _frameWidth = value;
    markNeedsPaint();
  }

  double get frameWidth => _frameWidth;

  Color get backgroundColor => _backgroundColor;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;
    final Paint background = Paint()
      ..color = _backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = frameWidth;

    final Canvas canvas = context.canvas;
    RRect rect = RRect.fromRectAndRadius(offset & size, Radius.circular(1));
    canvas.drawRRect(rect, background);
    context.paintChild(child!, offset);
  }
}
