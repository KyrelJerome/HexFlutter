import 'package:flutter/material.dart';

import 'HexShapeUtils.dart';

/*
  Clips a hexagon shape out of the child widget or container.
  Based on hexType, will be used to create the respective path.
*/
class HexagonClipper extends CustomClipper<Path> {
  final HexType type;
  final Size size;

  HexagonClipper(this.size) : type = HexType.Full;

  @override
  Path getClip(Size size) {
    Path path = getSimpleHexPath(size, type);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

