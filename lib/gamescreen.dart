//This is the actual game screen, where the players control the ball to hit the bars
import 'package:flutter/material.dart';
import 'bars.dart';
import 'ball.dart';
import 'mainmenu.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  final colorsBox = Hive.box('colors');
  var rightBarColor;
  var leftBarColor;

  @override
  void initState() {
    if (colorsBox.isNotEmpty) {
      rightBarColor = colorsBox.get('colors');
      }
    if (colorsBox.isNotEmpty) {
      leftBarColor = colorsBox.get('colors');
      }
    super.initState();
    rightBarColor =
        colorsBox.get('colors')['players']['rightPlayer']['gameBarColor'];
    leftBarColor =
        colorsBox.get('colors')['players']['leftPlayer']['gambeBarColor'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Stack(
          children: const [
            //left bar
            Bars(x: -0.9, y: 0, color: 'leftBarColor'),

            //right bar
            Bars(x: 0.9, y: 0, color: 'rightBarColor'),

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
