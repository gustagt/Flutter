import 'package:bytebankoficial/database/app_database.dart';
import 'package:flutter/material.dart';

import '../models/contacts.dart';

class ContacsForm extends StatefulWidget {
  const ContacsForm({Key? key}) : super(key: key);

  @override
  State<ContacsForm> createState() => _ContacsFormState();
}

class _ContacsFormState extends State<ContacsForm> {

  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorNumeroConta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controladorNome,
              decoration: InputDecoration(
                labelText: 'Nome Completo',
              ),
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _controladorNumeroConta,
                decoration: InputDecoration(
                  labelText: 'Numero da conta',
                ),
                style: TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    final String nome = _controladorNome.text;
                    final int? numeroConta = int.tryParse(_controladorNumeroConta.text);
                    final Contacts contato = Contacts(0,nome, numeroConta);
                    save(contato).then((id) => Navigator.pop(context));
                  },
                  child: Text('Criar'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
