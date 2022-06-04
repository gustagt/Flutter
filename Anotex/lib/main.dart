import 'package:anotex/telas/tela_inicial.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Anotex());
}

class Anotex extends StatelessWidget {
  const Anotex({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const TelaInicial()
    );
  }
}
