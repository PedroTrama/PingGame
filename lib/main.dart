//Authors:
//Jorge Yudi Saito Maruyama - 254274
//Pedro Trama Fernandes Pereira - 254344
//This is a simple ongoing project of a game called Ping based on the classic Pong
//As a default, all comments and variables are in english

//Main class for all the classes of the game
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //setPreferredOrientations function
import 'gamescreen.dart';
import 'mainmenu.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //sets the whole app to landscape mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
  );
  //removes the phone UI
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  await Hive.initFlutter();
  await Hive.openBox('settings');
  await Hive.openBox('userData');

  runApp(const Ping());
}

//Main widget for the screen
class Ping extends StatelessWidget {
  const Ping({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/game_screen': (context) => const GameScreen(),
      },
      home: const MenuScreen(),
    );
  }
}
