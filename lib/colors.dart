//This screen allows the player to change the color of the bars
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({Key? key}) : super(key: key);

  @override
  ColorsScreenState createState() => ColorsScreenState();
}

class ColorsScreenState extends State<ColorsScreen> {
  final List text = ["Branco", "Vermelho", "Azul", "Amarelo", "Verde"];
  final List colors = [
    Colors.white,
    const Color(0xffd23569),
    const Color(0xff389ae8),
    const Color(0xffecdd5a),
    const Color(0xff69dc6d)
  ];

  final colorsBox = Hive.box('colors');

  @override
  void initState() {
    if (colorsBox.isNotEmpty) {
    } else {}
    super.initState();
  }

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
                    onTap: () {
                      setState(() {
                        ///////TESTE///////
                        colorsBox.put('colors', colors[index]);
                        ///////////////////
                      });
                    },
                    title: Text(text[index % text.length],
                        textAlign: TextAlign.center)),
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
                      title: Text(text[index % text.length],
                          textAlign: TextAlign.center)),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
