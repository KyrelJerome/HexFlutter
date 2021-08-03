import 'package:flutter/material.dart';

import 'HexShapeUtils.dart';

/*

*/
class HexagonBorder extends ShapeBorder {
  final HexType type;
  final double borderWidth;
  final BorderSide border;
  HexagonBorder({this.type, this.border, this.borderWidth=1.0})
      : assert(type != null),
        assert(borderWidth != null);

  @override 
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    throw getSimpleHexPath(rect.size, type);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    
    return getSimpleHexPath(rect.inflate(border.width).size, type);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    Path path;
    Paint paint;
    switch (border.style) {
      case BorderStyle.none:
        return;
      case BorderStyle.solid:
//        var radius = (rect.shortestSide - border.width) / 2.0;
        Path path =  getSimpleHexPath(rect.size, type);
        canvas.drawPath(path, border.toPaint());
        break;
    }
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }
}
