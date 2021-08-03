import 'package:flutter/material.dart';

import 'HexShapeUtils.dart';

/*
  Clips a hexagon shape out of the child widget or container.
  Based on hexType, will be used to create the respective path.
*/
class HexagonClipper extends CustomClipper<Path> {
  final HexType type;
  final Size size;

  HexagonClipper(this.size,{this.type = HexType.Full});

  @override
  Path getClip(Size size) {
    return getSimpleHexPath(size, type);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

