//This class controls the bars and sets a few defaults
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
          color: Colors.white,
          width: 20,
          height: MediaQuery.of(context).size.width / 5,
        ),
      ),
    );
  }
}
