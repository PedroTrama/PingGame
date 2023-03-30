//Main class for all the classes of the game
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //setPreferredOrientations function
import 'gamescreen.dart';

//Running the game
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //set the whole app to landscape mode
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(const Ping());
  });
}

//Main widget for the screen
class Ping extends StatelessWidget {
  const Ping({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GameScreen(),
    );
  }
}
