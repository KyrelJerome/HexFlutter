import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'HexContainer.dart';
import 'HexagonFlex.dart';

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
      child: ListView(
        children: [
          HexagonFlex(6, children:[Text("Kyrel")]),
        ],
      ),
    );
  }
}
