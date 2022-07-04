import 'dart:convert';

import 'package:bytebankoficial/models/contacts.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../models/transaction.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print(data.url);
    print(data.headers);
    print(data.body);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data.statusCode);
    print(data.headers);
    print(data.body);
    return data;
  }
}

Future<List<Transaction>> findAll() async {
  final Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  final Response response =
      await client.get(Uri.parse('http://192.168.0.10:8080/transactions'));
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
