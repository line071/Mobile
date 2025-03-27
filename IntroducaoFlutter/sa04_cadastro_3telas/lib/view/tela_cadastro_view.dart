import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _formKey = GlobalKey<FormState>();
  String _nome = "";
  String _email = "";
  String _senha = "";
  String _genero = "";
  String _dataNascimento = "";
  double _experiencia = 0;
  bool _aceite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Usuário"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              TextFormField(
                decoration: InputDecoration(labelText: "Digite seu Nome"),
                validator:
                    (value) => value!.isEmpty ? "Campo obrigatório" : null,
                onSaved: (value) => _nome = value!,
              ),
              SizedBox(height: 10),

              TextFormField(
                decoration: InputDecoration(labelText: "Digite seu Email"),
                keyboardType: TextInputType.emailAddress,
                validator:
                    (value) => value!.contains("@") ? null : "E-mail inválido",
                onSaved: (value) => _email = value!,
              ),
              SizedBox(height: 10),

              TextFormField(
                decoration: InputDecoration(labelText: "Insira uma Senha"),
                obscureText: true,
                validator:
                    (value) =>
                        value!.length < 6
                            ? "A senha deve ter pelo menos 6 caracteres"
                            : null,
                onSaved: (value) => _senha = value!,
              ),
              SizedBox(height: 10),

              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: "Selecione seu Gênero"),
                items:
                    ["Masculino", "Feminino", "Outro"]
                        .map(
                          (String genero) => DropdownMenuItem(
                            value: genero,
                            child: Text(genero),
                          ),
                        )
                        .toList(),
                onChanged: (value) => setState(() => _genero = value!),
                validator:
                    (value) => value == null ? "Escolha um gênero" : null,
                onSaved: (value) => _genero = value!,
              ),
              SizedBox(height: 10),

              TextFormField(
                decoration: InputDecoration(labelText: "Data de Nascimento"),
                validator:
                    (value) =>
                        value!.isEmpty ? "Informe a Data de Nascimento" : null,
                onSaved: (value) => _dataNascimento = value!,
              ),

              Slider(
                value: _experiencia,
                min: 0,
                max: 30,
                divisions: 30,
                label: _experiencia.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _experiencia = value;
                  });
                },
              ),

              CheckboxListTile(
                value: _aceite,
                title: Text("Aceito os Termos de Uso"),
                onChanged: (value) => setState(() => _aceite = value!),
                controlAffinity: ListTileControlAffinity.leading,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, "/"),
                    child: Text("Voltar"),
                  ),
                  ElevatedButton(
                    onPressed: _enviarFormulario,
                    child: Text("Enviar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _enviarFormulario() {
    if (_formKey.currentState!.validate() && _aceite) {
      _formKey.currentState!.save();

      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text("Cadastro Realizado"),
              content: Text("Nome: $_nome\nE-mail: $_email"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                ),
              ],
            ),
      );

      // Aqui você pode adicionar lógica para enviar os dados para um servidor ou salvar localmente
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Preencha todos os campos corretamente!")),
      );
    }
  }
}
