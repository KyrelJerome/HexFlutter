import 'dart:ui';

enum HexType { leftHalf, RightHalf, Full }


  Path getSimpleHexPath(Size size,HexType type ) {
    Path path = Path();
    double x = size.width;
    double y = size.height;
    path.lineTo(x / 2, 0.0); //P0
    if (type == HexType.Full || type == HexType.RightHalf) {
      path.lineTo(x, y * 0.25); //P1
      path.lineTo(x, y * 0.75); //P2
    }
    path.lineTo(x / 2, y); //P3
    if (type == HexType.Full || type == HexType.RightHalf) {
      path.lineTo(0.0, y * 0.75); //P4
      path.lineTo(0.0, y * 0.25); //5
    }
    path.lineTo(x / 2, 0.0); // P0
    path.close();
    return path;
  }
