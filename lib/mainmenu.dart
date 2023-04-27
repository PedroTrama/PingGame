//This screen is the main page of the game. Here the user can login and access every page through the drawer
import 'package:flutter/material.dart';
import 'gamescreen.dart';
import 'about.dart';
import 'settings.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[900], elevation: 0),
      backgroundColor: Colors.grey[900],
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Login',
                    icon: Icon(Icons.account_circle_rounded,
                        color: Colors.grey))),
            TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: 'Senha',
                    icon: Icon(Icons.lock, color: Colors.grey))),
            Container(
              color: Colors.grey[200],
              child: Column(
                children: const <Widget>[
                  ListTile(
                    title: Text('Recorde: [-------]',
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    //this text should change colors to a darker grey after the user logs in
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Dificuldade: [-------]',
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    //this text should change colors to a darker grey after the user logs in
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Cor atual: [-------]',
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    //this text should change colors to a darker grey after the user logs in
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'PING',
              style: TextStyle(fontSize: 72, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GameScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              child: const Text(
                'Jogar',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()),
                );
              },
              backgroundColor: Colors.grey[900],
              elevation: 0,
              child: const Icon(Icons.settings)),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
            backgroundColor: Colors.grey[900],
            elevation: 0,
            child: const Icon(Icons.question_mark),
          ),
        ],
      ),
    );
  }
}
