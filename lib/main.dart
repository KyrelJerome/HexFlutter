import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

/*
  Base class for the embedded app. 
*/
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Main(title: 'Flutter Demo Home Page'),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MainState createState() => MainState();
}

/*
*/
class MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(height: 100, width: 100, color: Colors.blue),
          HexagonContainer(
              height: 100, width: 100, foregroundColor: Colors.black),
          HexagonCardChain(),
          HexagonCardChain(),
          HexagonCardChain(),
          HexagonCardChain(),
        ],
      ),
    );
  }
}

class HexagonCardChain extends StatelessWidget {
  final double tileWidth;
  final double tileHeight;
  final Orientation orientation;
  final int num = 4;
  HexagonCardChain()
      : tileWidth = 100,
        tileHeight = 100,
        orientation = Orientation.landscape;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < num; i++) {
      children.add(
        HexagonContainer(
          foregroundColor: Colors.black,
          height: tileWidth,
          width: tileHeight,
        ),
      );
    }
    return Row(
      children: children
    );
  }
}

class HexagonContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color foregroundColor;
  final Border border;
  final Widget child;

  const HexagonContainer(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.foregroundColor,
      this.border,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HexagonClipper(),
      child: Container(
        width: this.width,
        height: this.height,
        color: this.foregroundColor,
      ),
    );
  }
}

enum hexType { leftHalf, RightHalf, Full }

/*
  Clips a hexagon shape out of the child widget or container.
  Based on hexType, will be used to create the respective path.
*/
class HexagonClipper extends CustomClipper<Path> {
  final hexType type;

  HexagonClipper() : type = hexType.Full;
  Path _getSimpleHexPath(Size size) {
    Path path = Path();
    double x = size.width;
    double y = size.height;
    path.lineTo(x / 2, 0.0); //P0
    if (type == hexType.Full || type == hexType.RightHalf) {
      path.lineTo(x, y * 0.25); //P1
      path.lineTo(x, y * 0.75); //P2
    }
    path.lineTo(x / 2, y); //P3
    if (type == hexType.Full || type == hexType.RightHalf) {
      path.lineTo(0.0, y * 0.75); //P4
      path.lineTo(0.0, y * 0.25); //5
    }
    path.lineTo(x / 2, 0.0); // P0
    path.close();
    return path;
  }

  @override
  Path getClip(Size size) {
    Path path = _getSimpleHexPath(size);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
