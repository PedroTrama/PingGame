import 'package:flutter/material.dart';

class StartGame extends StatelessWidget {
  final bool gameHasStarted;

  StartGame({required this.gameHasStarted});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          alignment: Alignment(0, -0.2),
          child: Text(
            gameHasStarted ? '' : 'T O Q U E  P A R A  J O G A R',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
