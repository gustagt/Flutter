import 'dart:convert';

import 'package:bytebankoficial/http/webclient.dart';
import 'package:http/http.dart';

import '../../models/contacts.dart';
import '../../models/transaction.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client
        .get(Uri.parse(baseUrl))
        .timeout(const Duration(seconds: 5));
    List<Transaction> transactions = _toTransactions(response);
    return transactions;
  }

  List<Transaction> _toTransactions(Response response) {
    final List<dynamic> decodeJson = jsonDecode(response.body);
    final List<Transaction> transactions = [];

    for (Map<String, dynamic> trasnsactionJson in decodeJson) {
      final Map<String, dynamic> contactJson = trasnsactionJson['contact'];
      final Transaction transaction = Transaction(
        trasnsactionJson['value'],
        Contacts(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        ),
      );
      transactions.add(transaction);
    }
    return transactions;
  }

  Future<Transaction> save(Transaction transaction) async {
    Map<String, dynamic> transactionMap = _toMap(transaction);
    final String transactionJson = jsonEncode(transactionMap);
    final Response response =
    await client.post(Uri.parse(baseUrl),
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);

    return _toTransaction(response);
  }

  Transaction _toTransaction(Response response) {
    Map<String, dynamic> json = jsonDecode(response.body);

    final Map<String, dynamic> contactJson = json['contact'];
    final Transaction transactionReturn = Transaction(
      json['value'],
      Contacts(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );

    return transactionReturn;
  }

  Map<String, dynamic> _toMap(Transaction transaction) {
    final Map<String, dynamic> transactionMap = {
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.nome,
        'accountNumber': transaction.contact.numeroConta
      }
    };
    return transactionMap;
  }

}