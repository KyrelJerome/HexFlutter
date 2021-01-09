import 'package:flutter/material.dart';
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
    return Scaffold(
      body: ListView(
        children: [
          HexagonFlex(
            7,
            isOffset: true,
            childIndices: [0, 2],
            children: [
              Center(
                child: Text("Kyrel"),
              ),
              Center(
                child: Text("Kyrel"),
              ),
            ],
          ),
          Align(
            heightFactor: 0.5,
            child: HexagonFlex(
              8,
              children: [
                Center(
                  child: Text("Kyrel"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
