//This class is the settings screen where the player configures the game
import 'package:flutter/material.dart';
import 'package:ping/mainmenu.dart';
import 'package:ping/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Default settings
  double speed = 0.3;
  bool sound = true;
  final List<bool> difficulty = [false, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Velocidade:',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Slider(
                value: speed,
                thumbColor: Colors.black,
                activeColor: Colors.black,
                inactiveColor: Colors.white,
                onChanged: (newSpeed) {
                  setState(() {
                    speed = newSpeed;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Som:',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Switch(
                    activeColor: Colors.black,
                    inactiveThumbColor: Colors.black,
                    inactiveTrackColor: Colors.white,
                    activeTrackColor: Colors.white,
                    value: sound,
                    onChanged: (newSound) {
                      setState(() {
                        sound = newSound;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dificuldade:',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Checkbox(
                    activeColor: Colors.black,
                    value: difficulty[0],
                    onChanged: (newEasy) {
                      setState(() {
                        difficulty[0] = newEasy!;
                      });
                    },
                  ),
                  const Text('Fácil',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  Checkbox(
                    activeColor: Colors.black,
                    value: difficulty[1],
                    onChanged: (newMedium) {
                      setState(() {
                        difficulty[1] = newMedium!;
                      });
                    },
                  ),
                  const Text('Médio',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  Checkbox(
                    activeColor: Colors.black,
                    value: difficulty[2],
                    onChanged: (newHard) {
                      setState(() {
                        difficulty[2] = newHard!;
                      });
                    },
                  ),
                  const Text('Difícil',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ColorsScreen()),
              );
            },
            backgroundColor: Colors.grey[900],
            elevation: 0,
            child: const Icon(Icons.brush),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuScreen()),
              );
            },
            backgroundColor: Colors.grey[900],
            elevation: 0,
            child: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
