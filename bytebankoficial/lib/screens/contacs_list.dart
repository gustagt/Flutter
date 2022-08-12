import 'package:bytebankoficial/components/carregando.dart';
import 'package:bytebankoficial/database/dao/contact_dao.dart';
import 'package:bytebankoficial/models/contacts.dart';
import 'package:bytebankoficial/screens/contact_form.dart';
import 'package:bytebankoficial/screens/transaction_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: FutureBuilder<List<Contacts>>(
        initialData: const [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return const Carregando();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contacts> listContacts;
              listContacts = snapshot.data as List<Contacts>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contacts contact = listContacts[index];
                  return _ItemLista(contact, onClick: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransactionForm(contact)));
                  });
                },
                itemCount: listContacts.length,
              );
          }
          return const Text('Error Desconhecido');
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[900],
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactsForm()))
              .then((value) => setState(() {}));
          setState(() {});
        },
      ),
    );
  }
}

class _ItemLista extends StatelessWidget {
  final Contacts contact;
  final Function onClick;

  const _ItemLista(
    this.contact, {
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: [
          ListTile(
            onTap: () => onClick(),
            title: Text(
              contact.nome,
              style: const TextStyle(fontSize: 24.0),
            ),
            subtitle: Text(
              contact.numeroConta.toString(),
              style: const TextStyle(fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }
}
