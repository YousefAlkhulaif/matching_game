
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matching_game/card_image.dart';


class ShapesGame extends StatefulWidget {
  ShapesGame(this.pageMode, this.color, this.title, this.complementaryColor);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final int pageMode;
  final MaterialColor color;
  final String title;
  final MaterialColor complementaryColor;
  @override
  _ShapesGameState createState() => _ShapesGameState();
}
// ignore: must_be_immutable
class _ShapesGameState extends State<ShapesGame>{


  List<int> setPhotosIndexes() {
    var indexes, min, max;
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      switch(widget.pageMode) {

        case 0:{
          min = 0;
          max = 25;
        }
        break;
        case 1:{
          min = 25;
          max = 32;
        }
        break;
        case 2:{
          min = 0;
          max = 32;
        }
        break;
      }
      indexes = generatedPhoto(min, max);
    });
    return indexes;
  }
  List<int> generatedPhoto(int min, int max) {

    var photosIndexes = new List<int>();
    for (int i = min;i<max;i++){
      photosIndexes.add(i+1);
    }
    var photosIndexesSaved = new List<int>();
      for(int i = 0; i < 4;i++) {
        photosIndexes.shuffle();
        photosIndexesSaved.add(photosIndexes.removeAt(0));
      }

    return photosIndexesSaved;
  }

  @override
  Widget build(BuildContext context) {
    var photoIndexes = setPhotosIndexes();
      var mainImageIndex =  photoIndexes.elementAt(0);
    Widget cardImage = Card(
      child: ClipRRect(
        child: Image.asset('images/$mainImageIndex.jpg', width: 280, height: 280),
        borderRadius: new BorderRadius.all(Radius.elliptical(5, 5)),//
      ),
    );
    photoIndexes.shuffle();
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("إجابة صحيحة!"),
            content: Container(
              child: Column(
                children: <Widget>[
                  new CustomCard(50),
                  new Text(
                    "أحسنت!",
                    textScaleFactor: 5,
                    style: TextStyle(
                      inherit: true,
                      color: Colors.deepOrange
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setPhotosIndexes();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.complementaryColor,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DragTarget(
                builder: (context, List<int> candidateData, rejectedData) {

              return cardImage;

            },
                onAccept: (data) {
              if (data == mainImageIndex) {
                _showDialog();
              } else {
                print('no!:(');
              }
            }),
            Flexible(
              flex: 1,
              child: GridView.count(
//                padding: EdgeInsets.fromLTRB(0,0.0,0.0, 0.0),
                crossAxisCount: 2,

                childAspectRatio: 1.31,
                crossAxisSpacing: 0.0,
                padding: EdgeInsets.only(top: 2),
                children: <Widget>[
                  new CustomCard(photoIndexes[0]),
                  new CustomCard(photoIndexes[1]),
                  new CustomCard(photoIndexes[2]),
                  new CustomCard(photoIndexes[3]),
//                  Card(
//                    child: Draggable(
//                      child: ClipRRect(child: Image.asset('images/8.jpg', width: 280, height: 280),borderRadius: new BorderRadius.all(Radius.elliptical(100, 100)), ),
//                      feedback: dragged,
//                      childWhenDragging: Opacity(
//                        child: ClipRRect(child: Image.asset('images/4.jpg', width: 280, height: 280),borderRadius: new BorderRadius.all(Radius.elliptical(100, 100)), ),
//                        opacity: 0.5,
//                      ),
//                    ),
//                  ),
//                  Card(
//
//                    child: Draggable(
//                      child: ClipRRect(child: Image.asset('images/5.jpg', width: 280, height: 280),borderRadius: new BorderRadius.all(Radius.elliptical(5, 5)), ),
////                      data: "card5",
//                      feedback: dragged,
//                      childWhenDragging: Opacity(
//                        child: ClipRRect(child: Image.asset('images/5.jpg', width: 280, height: 280),borderRadius: new BorderRadius.all(Radius.elliptical(5, 5)), ),
//                        opacity: 0.5,
//                      ),
//                    ),
//                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.3, 0.5, 0.7, 0.9],
            colors: [
              widget.color[500],
              widget.color[600],
              widget.color[700],
              widget.color[800],
            ],
          ),
        ),
      ),
    );
  }
}

