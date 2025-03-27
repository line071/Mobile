import 'package:flutter/material.dart';

class TelaConfirmacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirmação de Cadastro"), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Text("Cadastro enviado com Sucesso"),
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, "/cadastro"),
                      icon: Icon(Icons.arrow_back, size: 50,)),
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, "/"),
                      icon: Icon(Icons.home, size: 50,)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}