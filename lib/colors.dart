//This screen allows the player to change the color of the bars
import 'package:flutter/material.dart';
import 'package:ping/settings.dart';

class ColorsScreen extends StatelessWidget {
  ColorsScreen({Key? key}) : super(key: key);

  final List text = ["Branco", "Vermelho", "Azul", "Amarelo", "Verde"];

  final List colors = [
    Colors.white,
    Color(0xffd23569),
    Color(0xff389ae8),
    Color(0xffecdd5a),
    Color(0xff69dc6d)
  ];

  final List icons = [
    Icons.brush,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          backgroundColor: Colors.grey[900],
          elevation: 0,
          title: const Text('Escolha a cor das barras')),
      body: Row(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                color: colors[index % colors.length],
                child: ListTile(
                    leading: Icon(Icons.brush),
                    title: Text(text[index % text.length])),
              );
            },
          )),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  color: colors[index % colors.length],
                  child: ListTile(
                      leading: Icon(Icons.brush),
                      title: Text(text[index % text.length])),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

