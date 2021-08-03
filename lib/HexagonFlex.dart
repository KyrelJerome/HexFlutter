import 'dart:math';

import 'package:flutter/material.dart';

import 'HexContainer.dart';
import 'HexShapeUtils.dart';

/*
  A wrapper for the Row widget that enables children to be placed in a
  specific spot
*/
class HexagonFlex extends StatelessWidget {
  final bool isOffset;
  final double hexWidth;
  final double hexHeight;
  final List<int> childIndices;
  // Children widget to be built into the children.
  final List<Widget> children;
  // Total number of hexagons in the flex.
  final int totalHex;
  final Orientation orientation;
  HexagonFlex(this.totalHex,
      {this.hexWidth = 0,
      this.hexHeight = 0,
      this.isOffset = false,
      this.childIndices = const [],
      this.children = const [],
      this.orientation = Orientation.landscape})
      : assert(children.length >= childIndices.length),
        assert(
          children.length < totalHex + 1,
        );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: buildLayout,
    );
  }

  Widget buildLayout(BuildContext context, BoxConstraints constraints) {
    int hexDrawn = totalHex + (isOffset ? 1 : 0);
    double tileWidth =
        hexWidth == 0 ? constraints.biggest.width / hexDrawn : hexWidth;
    double tileHeight =
        hexHeight == 0 ? constraints.biggest.width / hexDrawn : hexHeight;

    List<Widget> renderedChildren = populateRenderedChildren(
      tileWidth,
      widthToHeight(tileHeight),
    );
    // Add horizontal Offset if required.
    if (isOffset) {
      renderedChildren.insert(
        0,
        HexagonContainer(
          type: HexType.RightHalf,
          foregroundColor: Colors.black,
          height: widthToHeight(tileWidth),
          width: tileWidth,
        ),
      );
      renderedChildren.add(
        HexagonContainer(
          type: HexType.LeftHalf,
          foregroundColor: Colors.black,
          height: widthToHeight(tileWidth),
          width: tileHeight,
        ),
      );
    }
    return Container(
      height: widthToHeight(tileWidth),
      width: tileWidth * hexDrawn,
      child: Orientation.portrait == orientation
          ? Column(
              children: renderedChildren,
            )
          : Row(children: renderedChildren),
    );
  }

  // Obtains the height required for a hexagon of width X
  double widthToHeight(double width) {
    return 2 * width / sqrt(3);
  }

  List<int> getTrueChildIndices() {
    List<int> trueChildIndices = childIndices;

    if (trueChildIndices.length == 0) {
      //Pad beginning
      int pad = (totalHex - children.length) ~/ 2;
      trueChildIndices = List.generate(children.length, (index) => pad + index);
    }
    return trueChildIndices;
  }

  List<Widget> populateRenderedChildren(tileWidth, tileHeight) {
    List<Widget> renderedChildren = [];
    List trueChildIndices = getTrueChildIndices();
    int childIndex = 0;
    for (int i = 0; i < totalHex; i++) {
      if (0 < trueChildIndices.length &&
          childIndex < children.length &&
          i == trueChildIndices[childIndex]) {
        renderedChildren.add(HexagonContainer(
          foregroundColor: Colors.white,
          height: tileHeight,
          width: tileWidth,
          child: children[childIndex],
        ));
        childIndex += 1;
      } else {
        renderedChildren.add(
          HexagonContainer(
            foregroundColor: Colors.black,
            height: tileHeight,
            width: tileWidth,
          ),
        );
      }
    }
    return renderedChildren;
  }
}
