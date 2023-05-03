//This screen is the main page of the game. Here the user can login and access every page through the drawer
import 'package:flutter/material.dart';
import 'gamescreen.dart';
import 'about.dart';
import 'settings.dart';
import 'package:hive/hive.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  final loginBox = Hive.box('userData');
  final passwordBox = Hive.box('userData');
  String login = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[900], elevation: 0),
      backgroundColor: Colors.grey[900],
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            TextFormField(
              onChanged: (newLogin) {
                  setState(() {
                    login = newLogin;
                    loginBox.put('login', newLogin);
                    login = loginBox.get('login');
                  });
                },
                decoration: const InputDecoration(
                    hintText: 'Login',
                    icon: Icon(Icons.account_circle_rounded,
                        color: Colors.grey))),
            TextFormField(
                onChanged: (newPassword) {
                  setState(() {
                    password = newPassword;
                    passwordBox.put('password', newPassword);
                    password = passwordBox.get('password');
                  });
                },
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
              heroTag: const Text("settingsFAB"),
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
            heroTag: const Text("aboutFAB"),
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
