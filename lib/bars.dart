//This class controls the bars and sets a few defaults
import 'package:flutter/material.dart';

class Bars extends StatelessWidget {
  //Coordinates
  final x;
  final y;

  const Bars({super.key, this.x, this.y});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x.toDouble(), y.toDouble()),
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
