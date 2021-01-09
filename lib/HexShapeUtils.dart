import 'dart:math';
import 'dart:ui';

enum HexType { LeftHalf, RightHalf, Full }
// Draws a hexagon according to size.
Path getSimpleHexPath(Size size, HexType type) {
  Path path = Path();
  //double halfWidth = x/2;
  /*
  path.lineTo(halfWidth, 0.0); //P0
  path.lineTo(x, halfWidth *); //P1
  path.lineTo(x, y * 0.75); //P2
  path.lineTo(x / 2, y); //P3
  path.lineTo(0.0, y * 0.75); //P4
  path.lineTo(0.0, y * 0.25); 
  path.lineTo(x/2, 0.0);//5
  */
  double r = (size.height/2);
  print("Drawing");
  double angle = 2 * pi / 6;
  for (int i = 0; i < 7; i++)
  { 
    double x = size.width/2 + r * sin(i * angle);
    double y =  size.height/2 + r * cos(i * angle);
    print("Drawing:$x , $y");
    path.lineTo(x, y);
  }
  path.close();
  return path;
}

Path getRightHexPath(Size size, HexType type) {
  Path path = Path();
  double r = (size.height/2);
  print("Drawing");
  double angle = 2 * pi / 6;
  for (int i = 0; i < 4; i++)
  { 
    double x =  r * sin(i * angle);
    double y =  size.height/2 + r * cos(i * angle);
    print("Drawing:$x , $y");
    path.lineTo(x, y);
  }
  path.close();
  return path;
}

Path getLeftHexPath(Size size, HexType type) {
  Path path = Path();
  double r = (size.height/2);
  print("DrawingRight***");
  double angle = 2 * pi / 6;
  for (int i = 3; i < 7; i++)
  { 
    double x = size.width + r * sin(i * angle);
    double y =  size.height/2 + r * cos(i * angle);
    print("DrawingRight:$x , $y");
    path.lineTo(x, y);
  }
  path.lineTo(size.width,0);
  path.close();
  return path;
}