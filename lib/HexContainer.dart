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
  final HexType type;
  const HexagonContainer(
      {Key key,
      this.type = HexType.Full,
      @required this.height,
      @required this.width,
      @required this.foregroundColor,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double usedWidth = this.type == HexType.Full? 1: 0.5; 
    return ClipPath(
      clipper: HexagonClipper(Size(height, width*usedWidth),type: this.type),
      child: Container(
        width: this.width*usedWidth,
        height: this.height,
        color: this.foregroundColor,
        child: this.child,
      ),
    );
  }
}
