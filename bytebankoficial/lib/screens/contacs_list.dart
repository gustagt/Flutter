import 'package:bytebankoficial/database/app_database.dart';
import 'package:bytebankoficial/models/contacts.dart';
import 'package:bytebankoficial/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContacsList extends StatefulWidget {
  @override
  State<ContacsList> createState() => _ContacsListState();
}

class _ContacsListState extends State<ContacsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de contatos'),
      ),
      body: FutureBuilder<List<Contacts>>(
        initialData: [],
        future: findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text('Carregando'),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contacts> listContacts;
              listContacts = snapshot.data as List<Contacts>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contacts contact = listContacts[index];
                  return _ItemLista(contact);
                },
                itemCount: listContacts.length,
              );
          }
          return Text('Error Desconhecido');
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[900],
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContacsForm())).then((value) => setState(() {}));
        },
      ),
    );
  }
}

class _ItemLista extends StatelessWidget {
  final Contacts contact;

  const _ItemLista(this.contact);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              contact.nome,
              style: TextStyle(fontSize: 24.0),
            ),
            subtitle: Text(
              contact.numeroConta.toString(),
              style: TextStyle(fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }
}
