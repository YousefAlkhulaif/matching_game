
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matching_game/card_image.dart';

// ignore: must_be_immutable
class ShapesGame extends StatelessWidget{
  List<int> generatedPhoto() {
    var photosIndexes = new List<int>();
    for (int i = 0;i<16;i++){
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
    var photoIndexes = generatedPhoto();
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
            title: new Text("Alert Dialog title"),
            content: Container(
                child: new CustomCard(100),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('مُنَوّع'),
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
                  print(data);
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
              Colors.blue[500],
              Colors.blue[600],
              Colors.blue[700],
              Colors.blue[800],
            ],
          ),
        ),
      ),
    );
  }
}
