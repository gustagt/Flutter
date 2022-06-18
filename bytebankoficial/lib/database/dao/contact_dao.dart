import 'package:sqflite/sqflite.dart';

import '../../models/contacts.dart';
import '../app_database.dart';

class ContactDao{

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contacts contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Future<List<Contacts>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Contacts> contacts = [];
    _toList(result, contacts);
    return contacts;
  }


  Map<String, dynamic> _toMap(Contacts contact) {
    final Map<String, dynamic> contactMap = {};
    contactMap[_name] = contact.nome;
    contactMap[_accountNumber] = contact.numeroConta;
    return contactMap;
  }

  void _toList(List<Map<String, dynamic>> result, List<Contacts> contacts) {
    for (Map<String, dynamic> row in result) {
      final Contacts contact = Contacts(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
  }
}