
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final IconData? icone;
  final String texto, dica;

   const Editor(this.controlador, this.texto, this.dica, {this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: TextField(
        controller: controlador,
        style: const TextStyle(fontSize: 24),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: texto,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}