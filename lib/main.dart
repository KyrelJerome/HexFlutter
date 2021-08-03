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
    int numCols = 12;
    List<Widget> listRows = List();
    for (int i = 0; i < 10; i++) {
      listRows.add(HexagonFlex(
        numCols - 1,
        isOffset: true,
        childIndices: [0, 3, 5,9],
        children: [
          Container(child: IconButton(icon: Icon(Icons.ac_unit), onPressed: () {  },)),
          Container(
            color:Colors.green,
            child: Center(
              child: Text("TestTile"),
            ),
          ),
          Center(
            child: Text("TestTile"),
          ),
          Center(
            child: Text("TestTile3"),
          ),
        ],
      ));
      listRows.add(
        Align(
          heightFactor: 0.459,
          child: HexagonFlex(
            numCols,
            children: [
              Center(
                child: Text("TestTile"),
              ),
              Center(
                child: Text("TestTile"),
              ),
              
              Center(
                child: Text("TestTile"),
              ),
              
              Center(
                child: Text("TestTile"),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: ListView(
        cacheExtent: 300,
        children: listRows,
      ),
    );
  }
}
