//This page shows infos about the game to the player
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'SOBRE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Esse jogo é inspirado no clássico de Atari Pong em que dois jogadores movem barras para impedir que a bolinha acerte a parede. Em Ping, você controla a bolinha!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
                            Image.asset( // Add an Image widget here
                'lib/assets/atari.jpg', // Replace with the path to your image
                height: 50, // Set the desired height of the image
                width: 50, // Set the desired width of the image
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.grey[900],
        elevation: 0,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
