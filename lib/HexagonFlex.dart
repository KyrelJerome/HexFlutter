import 'package:flutter/material.dart';

import 'HexContainer.dart';
import 'HexShapeUtils.dart';

/*
  A wrapper for the Row widget that enables children to be placed in a
  specific spot
*/
class HexagonFlex extends StatelessWidget {
  final double hexWidth;
  final double hexHeight;
  final List<int> childIndices;
  // Children widget to be built into the children.
  final List<Widget> children;
  // Total number of hexagons in the flex.
  final int totalHex;
  final Orientation orientation;
  HexagonFlex(this.totalHex)
      : hexWidth = 0,
        hexHeight = 0,
        childIndices = [],
        children = [],
        orientation = Orientation.landscape;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: hexFlexBuilder,
      ),
    );
  }

  Widget hexFlexBuilder(BuildContext context, BoxConstraints constraints) {
    List<int> trueChildIndices = childIndices;
    double tileWidth = hexWidth == 0 ? constraints.maxWidth / totalHex : hexWidth;
    double tileHeight = hexHeight == 0 ? constraints.maxWidth / totalHex : hexHeight;
    if (trueChildIndices == []) {
      //Pad beginning
      int pad = (totalHex - children.length) ~/ 2;
      trueChildIndices = List.generate(children.length, (index) => pad + index);
    }

    // Build Hexagon Row
    int childIndex = 0;
    for (int i = 0; i < totalHex; i++) {
      if (i == trueChildIndices[childIndex]) {
        HexagonContainer(
          foregroundColor: Colors.black,
          height: tileWidth,
          width: tileHeight,
          child: children[childIndex],
        );
        childIndex += 1;
      } else {
        children.add(
          HexagonContainer(
            foregroundColor: Colors.black,
            height: tileWidth,
            width: tileHeight,
          ),
        );
      }
    }

    return Orientation.portrait == orientation
        ? Column(
            children: children,
          )
        : Row(children: children);
  }
}
