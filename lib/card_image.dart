import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  final int imageIndex;

  const CustomCard(
    this.imageIndex,
  ) : assert(imageIndex != null);

  @override
  Widget build(BuildContext context) {
    Widget border = ClipRRect(
      child: Image.asset('images/$imageIndex.jpg', width: 280, height: 280),
      borderRadius: new BorderRadius.all(Radius.elliptical(5, 5)),
    );
    return Card(
      child: Draggable(
        child: border,
        feedback: border,
        data: imageIndex,
        childWhenDragging: Opacity(
          child: border,
          opacity: 0.3,
        ), //
      ),
    );
  }
}
