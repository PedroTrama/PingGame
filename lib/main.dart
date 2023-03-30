import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(Ping());
}

class Ping extends StatelessWidget {
  const Ping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
