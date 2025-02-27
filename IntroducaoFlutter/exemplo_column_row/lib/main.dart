import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exemplo Colunas(Column) e Linhas(Row)"),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,//Vertical
          crossAxisAlignment: CrossAxisAlignment.center,//horizontal
          children: [
            Text("linha 1"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Coluna 1"),
                Text("Coluna 2")
              ],
            ),
            Text("LInha 3")
          ],
        ),
      ));
  }
}
