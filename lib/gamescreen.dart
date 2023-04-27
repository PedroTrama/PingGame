//This is the actual game screen, where the players control the ball to hit the bars
import 'package:flutter/material.dart';
import 'bars.dart';
import 'ball.dart';
import 'mainmenu.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Tem certeza que deseja sair do jogo?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuScreen()),
                    );
                  },
                  child:
                      const Text('Sim', style: TextStyle(color: Colors.black)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      const Text('Não', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          );
        },
        backgroundColor: Colors.grey[900],
        elevation: 0,
        child: const Icon(Icons.exit_to_app),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
