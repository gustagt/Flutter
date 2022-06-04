import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controlCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controlCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando Transfêrencia')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(_controlCampoNumeroConta, 'Numero da conta', '0000'),
            Editor(_controlCampoValor, 'Valor', '0.00',
                icone: Icons.monetization_on),
            ElevatedButton(
              onPressed: () => criaTransferencia(context),
              child: Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }

  void criaTransferencia(BuildContext context) {
    final int? numConta = int.tryParse(_controlCampoNumeroConta.text);
    final double? valor = double.tryParse(_controlCampoValor.text);

    if (valor != null && numConta != null) {
      Transferencia tranferenciaCriada = Transferencia(valor, numConta);
      Navigator.pop(context, tranferenciaCriada);
      debugPrint('$tranferenciaCriada');
      debugPrint('Chegou no cria transferencia');
    }
  }
}

class FormularioTransferencia extends StatefulWidget {
  @override
  State<FormularioTransferencia> createState() =>
      _FormularioTransferenciaState();
}
