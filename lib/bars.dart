//This class controls the bars and sets a few defaults
import 'package:flutter/material.dart';

class Bars extends StatefulWidget {
  //Coordinates
  final x;
  final y;
  const Bars({Key? key, this.x, this.y}) : super(key: key);

  @override
  BarsState createState() => BarsState();
}

class BarsState extends State<Bars> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(widget.x.toDouble(), widget.y.toDouble()),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 20,
          height: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
