//This class is the settings screen where the player configures the game
import 'package:flutter/material.dart';
import 'mainmenu.dart';
import 'colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Default settings
  double speed = 0.3;
  bool sound = true;
  int selectedDifficulty = 1;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dificuldade:',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      Radio(
                        activeColor: Colors.white,
                        value: 0,
                        groupValue: selectedDifficulty,
                        onChanged: (value) {
                          setState(() {
                            selectedDifficulty = value as int;
                          });
                        },
                      ),
                      const Text('Fácil',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: Colors.white,
                        value: 1,
                        groupValue: selectedDifficulty,
                        onChanged: (value) {
                          setState(() {
                            selectedDifficulty = value as int;
                          });
                        },
                      ),
                      const Text('Médio',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: Colors.white,
                        value: 2,
                        groupValue: selectedDifficulty,
                        onChanged: (value) {
                          setState(() {
                            selectedDifficulty = value as int;
                          });
                        },
                      ),
                      const Text('Difícil',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
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
                MaterialPageRoute(builder: (context) => ColorsScreen()),
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
