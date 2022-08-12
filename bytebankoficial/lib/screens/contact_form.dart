import 'package:flutter/material.dart';

import '../database/dao/contact_dao.dart';
import '../models/contacts.dart';


class ContactsForm extends StatelessWidget {

  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final ContactDao _dao = ContactDao();

  ContactsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controladorNome,
              decoration: const InputDecoration(
                labelText: 'Nome Completo',
              ),
              style: const TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _controladorNumeroConta,
                decoration: const InputDecoration(
                  labelText: 'Numero da conta',
                ),
                style: const TextStyle(fontSize: 24.0),
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
                    _dao.save(contato).then((id) => Navigator.pop(context));
                  },
                  child: const Text('Criar'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
