//This class is the game's screen. It contains every element of the game
import 'package:flutter/material.dart';
import 'bars.dart';
import 'ball.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Stack(
          children: const [
            //left bar
            Bars(x: -0.9, y: 0),

            //right bar
            Bars(x: 0.9, y: 0),

            //ball
            Ball(x: 0, y: 0),
            
          ],
        ),
      ),
    );
  }
}
