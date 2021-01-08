import 'package:flutter/material.dart';

import 'HexContainer.dart';
import 'HexShapeUtils.dart';

/*
  A wrapper for the Row widget that enables children to be placed in a
  specific spot
*/
class HexagonFlex extends StatelessWidget {
  final double hexWidth = 0;
  final double hexHeight = 0;
  final List<int> childIndices = const [];
  // Children widget to be built into the children.
  final List<Widget> children =  const [];
  // Total number of hexagons in the flex.
  final int totalHex;
  final Orientation orientation = Orientation.landscape;
  HexagonFlex(this.totalHex,{hexWidth = 0,
        hexHeight = 0,
        childIndices = const [],
        children = const [],
        orientation = Orientation.landscape}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: hexFlexBuilder,
    );
  }

  Widget hexFlexBuilder(BuildContext context, BoxConstraints constraints) {
    print("Fine");
    List<int> trueChildIndices = childIndices;
    double tileWidth =
        hexWidth == 0 ? constraints.biggest.width / totalHex : hexWidth;
    double tileHeight =
        hexHeight == 0 ? constraints.biggest.width / totalHex : hexHeight;
    if (trueChildIndices == []) {
      //Pad beginning
      int pad = (totalHex - children.length) ~/ 2;
      trueChildIndices = List.generate(children.length, (index) => pad + index);
    }
    print("Fine2");
    List<Widget> renderedChildren = [];
    // Build Hexagon Row
    int childIndex = 0;
    for (int i = 0; i < totalHex; i++) {
      if ( 0< trueChildIndices.length &&i == trueChildIndices[childIndex]) {
        renderedChildren.add(HexagonContainer(
          foregroundColor: Colors.black,
          height: tileWidth,
          width: tileHeight,
          child: children[childIndex],
        ));
        childIndex += 1;
      } else {
        renderedChildren.add(
          HexagonContainer(
            foregroundColor: Colors.black,
            height: tileWidth,
            width: tileHeight,
          ),
        );
      }
    }
    print("Size:" + tileWidth.toString());
    print("Objects made:"+ renderedChildren.length.toString() );
    return Container(
      height: tileWidth,
      width: tileWidth*totalHex,
      child: Orientation.portrait == orientation
          ? Column(
              children: renderedChildren,
            )
          : Row(children: renderedChildren),
    );
  }
}
