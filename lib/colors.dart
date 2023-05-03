//This screen allows the player to change the color of the bars
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class ColorsScreen extends StatelessWidget {
  ColorsScreen({Key? key}) : super(key: key);
  //Lists to generate the ListView with the builder
  final List text = ["Branco", "Vermelho", "Azul", "Amarelo", "Verde"];

  final List colors = [
    Colors.white,
    const Color(0xffd23569),
    const Color(0xff389ae8),
    const Color(0xffecdd5a),
    const Color(0xff69dc6d)
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
                    onTap: () {},
                    title: Text(text[index % text.length], textAlign: TextAlign.center)),
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
                      onTap: () {},
                      title: Text(text[index % text.length], textAlign: TextAlign.center)),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
