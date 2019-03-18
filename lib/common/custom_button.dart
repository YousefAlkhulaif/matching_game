import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Color firstColor;
  final Color secondColor;
  final double width;
  final double height;
  final Function onPress;

  const CustomButton(
    this.label,
    this.firstColor,
    this.secondColor,
    this.onPress,
    {
      this.width = 160,
      this.height = 70
    }
  ) : assert(label != null && label != ''),
      assert(firstColor != null),
      assert(secondColor != null),
      assert(onPress != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GradientCard(
        margin: EdgeInsets.all(0),
        child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: onPress,
          child: Container(
            padding: EdgeInsets.all(0),
            width: this.width,
            height: this.height,
            alignment: Alignment.center,
            child: Text(this.label, style: Theme.of(context).textTheme.title,)
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            this.firstColor,
            this.secondColor,
          ],
        ),
      ),


    );
  }
}
