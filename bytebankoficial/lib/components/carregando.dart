import 'package:flutter/material.dart';

class Carregando extends StatelessWidget {
  const Carregando({this.message = 'Carregando'});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(message),
        ],
      ),
    );
  }
}
