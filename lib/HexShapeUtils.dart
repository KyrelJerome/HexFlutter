import 'dart:math';
import 'dart:ui';

enum HexType { LeftHalf, RightHalf, Full }
// Draws a hexagon according to size.
Path getSimpleHexPath(Size size, HexType type, {double offsetAngle=0}) {
  if(type == HexType.LeftHalf){
    return getLeftHexPath(size);
  }
  else if(type == HexType.RightHalf){
    return getRightHexPath(size);
  }
  else{
    return getFullHexPath(size);
  }
}

// Draws a hexagon path according to size and type.
Path getFullHexPath(Size size, {double offsetAngle=0}) {
  Path path = Path();
  double maxdim = size.longestSide;
  double r = (maxdim/2);
  //print("Drawing");
  double angle = offsetAngle + (2 * pi / 6);
  for (int i = 0; i < 7; i++)
  { 
    double x = size.width/2 + r * sin(i * angle);
    double y =  size.height/2 + r * cos(i * angle);
    x = epsilonRound(x , [0, size.width]);
    y = epsilonRound(y,[0, size.height]);
    x = midpointRound(x, size.width/2);
    y = midpointRound(y, size.height/2);
    //print("Drawing:$x , $y");
    path.lineTo(x, y);
  }
  path.close();
  return path;
}
Path getRightHexPath(Size size,{double offsetAngle=0}) {
  Path path = Path();
  double maxdim = size.longestSide;
  double r = (maxdim/2);
  //print("Drawing");
  double angle = offsetAngle + (2 * pi / 6);
  for (int i = 0; i < 4; i++)
  { 
    double x =  r * sin(i * angle);
    double y =  size.height/2 + r * cos(i * angle);
    x = epsilonRound(x , [0, size.width]);
    y = epsilonRound(y,[0, size.height]);
    x = midpointRound(x, size.width/2);
    y = midpointRound(y, size.height/2);
    //print("DrawingRight:$x , $y");
    path.lineTo(x, y);
  }
  path.close();
  return path;
}

Path getLeftHexPath(Size size, {double offsetAngle=0}) {
  Path path = Path();
  double maxdim = size.longestSide;
  double r = (maxdim/2);
  // print("Drawing");
  double angle = offsetAngle + (2 * pi / 6);
  for (int i = 3; i < 7; i++)
  { 
    double x = size.width + r * sin(i * angle);
    double y =  size.height/2 + r * cos(i * angle);
    x = epsilonRound(x , [0, size.width]);
    y = epsilonRound(y,[0, size.height]);
    x = midpointRound(x, size.width/2);
    y = midpointRound(y, size.height/2);
    // print("DrawingLeft:$x , $y");
    path.lineTo(x, y);
  }
  path.lineTo(size.width,0);
  path.close();
  return path;
}
double midpointRound(double val, double midpoint){
   return val > midpoint ? val.ceilToDouble() : val.floorToDouble();
}
double epsilonRound(double val, List<double> goals){
  double epsilon = 4;
  for(double goal in goals){
    if( goal + epsilon > val && val >goal-epsilon){
      return goal;
    }
  }
  return val.roundToDouble();
}