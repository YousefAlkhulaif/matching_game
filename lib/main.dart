import 'package:flutter/material.dart';
import 'package:matching_game/common/custom_button.dart';
import 'package:matching_game/global.dart';
import 'package:matching_game/shapes_game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Matching Game',
      theme: Global.getThemeData(),
      builder: (BuildContext context, Widget child) {
        return new Directionality(
          textDirection: TextDirection.rtl,
          child: new Builder(
            builder: (BuildContext context) {
              return new MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,
                ),
                child: child,
              );
            },
          ),
        );
      },
      home: MyHomePage(title: 'لعبة المطابقة'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int imagesMode = 0;
  int shapesMode = 1;
  int allMode = 2;
  String imagesModeString = 'طَابِق';
  String shapesModeString = 'مَيِّز';
  String allModeString = 'مُنَوَّع';
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Center(
      child: Container(
        color: Theme.of(context).accentColor,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 80),
                    child: Text(widget.title,
                        style: Theme.of(context).textTheme.headline))),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CustomButton(
                  shapesModeString,
                      Colors.green[200],
                      Colors.green[800],
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShapesGame(imagesMode, Colors.lightGreen, imagesModeString, Colors.lightBlue)))),
                  CustomButton(
                      imagesModeString,
                      Colors.yellow[200],
                      Colors.yellow[800],
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShapesGame(shapesMode, Colors.amber, shapesModeString, Colors.green)))),
                  CustomButton(
                      allModeString,
                      Colors.blue[200],
                      Colors.blue[800],
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShapesGame(allMode, Colors.blue, allModeString, Colors.deepPurple)))),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
