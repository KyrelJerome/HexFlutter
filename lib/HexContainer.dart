import 'package:flutter/material.dart';

import 'HexClipper.dart';
import 'HexShapeUtils.dart';

/*

*/
class HexagonContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color foregroundColor;
  final Widget child;

  const HexagonContainer(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.foregroundColor,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HexagonClipper(Size(height, width)),
      child: Container(
        width: this.width,
        height: this.height,
        color: this.foregroundColor,
        child: this.child,
      ),
    );
  }
}
