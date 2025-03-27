import 'package:flutter/material.dart';

import 'view/tela_boas_vindas.dart';
import 'view/tela_cadastro_view.dart' show TelaCadastro;
import 'view/tela_confirmacao_view.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => TelaBoasVindas(),
         "/cadastro":(context)=>TelaCadastro(),
        "/confirmacao":(context)=>TelaConfirmacao()
      },
    ),
  );
}
