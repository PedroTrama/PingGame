//This is the actual game screen, where the players control the ball to hit the bars
import 'dart:async';
import 'package:flutter/material.dart';
import 'startgame.dart';
import 'bars.dart';
import 'ball.dart';
import 'mainmenu.dart';
//https://docs.flame-engine.org/latest/flame/game_widget.html

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  //System variables
  bool gameHasStarted = false;

  //Ball variables
  double ballX = 0;
  double ballY = 0;
  bool right = true;
  bool left = false;
  bool up = false;
  bool down = false;

  //Bars variables
  double leftBarX = -0.9;
  double leftBarY = 0;
  double rightBarX = 0.9;
  double rightBarY = 0;

  void moveBall() {
    ballDirection(); // Update the ball direction before moving it

    // Horizontal Movement
    if (right) {
      if (ballX < rightBarX) {
        ballX += 0.01; // Increment the x coordinate to move right
      } else {
        ballX -= 0.01; // Decrease the x coordinate to change direction
      }
    } else {
      if (ballX > leftBarX) {
        ballX -= 0.01; // Decrement the x coordinate to move left
      } else {
        ballX += 0.01; // Increase the x coordinate to change direction
      }
    }

    // Vertical Movement
    if (up) {
      if (ballY < 1) {
        ballY += 0.01; // Increment the y coordinate to move up
      } else {
        ballY -= 0.01; // Decrease the y coordinate to change direction
      }
    } else {
      if (ballY > -1) {
        ballY -= 0.01; // Decrement the y coordinate to move down
      } else {
        ballY += 0.01; // Increase the y coordinate to change direction
      }
    }
  }

  void ballDirection() {
    if (ballX >= rightBarX &&
        ballY >= (rightBarY - 0.25) &&
        ballY <= (rightBarY + 0.25)) {
      right = false; // Change the direction to move left
      left = true;
    } else if (ballX <= leftBarX &&
        ballY >= (leftBarY - 0.25) &&
        ballY <= (leftBarY + 0.25)) {
      right = true; // Change the direction to move right
      left = false;
    } else if (ballX > rightBarX) {
      right = true;
      left = false;
      up = false;
      down = false;
      ballX = 0;
      ballY = 0;
    } else if (ballX < leftBarX) {
      left = true;
      right = false;
      up = false;
      down = false;
      ballX = 0;
      ballY = 0;
    }

    // Adjust ball movement based on collision with screen edges
    if (ballY >= 1) {
      if (right) {
        up = true;
        down = false;
      } else {
        up = false;
        down = true;
      }
    } else if (ballY <= -1) {
      if (right) {
        up = false;
        down = true;
      } else {
        up = true;
        down = false;
      }
    }
  }

  //System functions
  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 35), (timer) {
      setState(() {
        moveBall();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: startGame,
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Center(
            child: Stack(
              children: [
                //game start
                StartGame(gameHasStarted: gameHasStarted),

                //left Bar
                Bars(x: leftBarX, y: leftBarY),

                //right Bar
                Bars(x: rightBarX, y: rightBarY),

                //ball
                Ball(x: ballX, y: ballY),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            leftBarY -= 0.1; // adjust the value as needed
                          });
                        },
                        child: const Icon(Icons.arrow_upward),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            rightBarY -= 0.1; // adjust the value as needed
                          });
                        },
                        child: const Icon(Icons.arrow_upward),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            leftBarY += 0.1; // adjust the value as needed
                          });
                        },
                        child: const Icon(Icons.arrow_downward),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            rightBarY += 0.1; // adjust the value as needed
                          });
                        },
                        child: const Icon(Icons.arrow_downward),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                    ],
                  ),
                ),
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
                      child: const Text('Sim',
                          style: TextStyle(color: Colors.black)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Não',
                          style: TextStyle(color: Colors.black)),
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
        ));
  }
}
