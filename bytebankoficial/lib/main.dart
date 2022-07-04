import 'package:bytebankoficial/http/webclient.dart';
import 'package:bytebankoficial/screens/contacs_list.dart';
import 'package:bytebankoficial/screens/contact_form.dart';
import 'package:flutter/material.dart';

import 'database/app_database.dart';
import 'models/contacts.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(const bytebankApp());
  findAll().then((transactions) => print('lista $transactions'));
}

class bytebankApp extends StatelessWidget {
  const bytebankApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
          appBarTheme: AppBarTheme(color: Colors.green[900]),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )),
      home: Dashbord(),
    );
  }
}

