//This class controls the game ball
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Ball extends StatelessWidget {
  //Coordinates
  final x;
  final y;

  const Ball({super.key, this.x, this.y});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x.toDouble(), y.toDouble()),
      child: Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        width: 20,
        height: 20,
      ),
    );
  }
}
