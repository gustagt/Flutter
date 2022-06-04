import 'package:anotex/blocs/atividade_bloc.dart';
import 'package:anotex/blocs/atividade_evento.dart';
import 'package:anotex/modelo/atividade.dart';
import 'package:flutter/material.dart';

class FormDescricao extends StatefulWidget {
  final AtividadeBloc bloc;

  const FormDescricao(this.bloc, {Key? key}) : super(key: key);

  @override
  State<FormDescricao> createState() => _FormDescricaoState();
}

class _FormDescricaoState extends State<FormDescricao> {
  final TextEditingController crotoladorTitulo = TextEditingController();
  final TextEditingController crotoladorDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adiconar Anotação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(children: [
            TextField(
              controller: crotoladorTitulo,
              decoration:
              const InputDecoration(labelText: 'Titulo da Atividade'),
              style: const TextStyle(fontSize: 22.0),
            ),
            TextField(
              controller: crotoladorDescricao,
              maxLines: null,
              decoration: const InputDecoration(labelText: 'Descrição'),
              style: const TextStyle(fontSize: 20.0),
            ),
            _botaoAdd()
          ]),
        ),
      ),
    );
  }

  SizedBox _botaoAdd() {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ElevatedButton(
            onPressed: () {
              final String titulo = crotoladorTitulo.text;
              final String descricao = crotoladorDescricao.text;
              if (titulo != '') {
                final Atividade novaAtividade =
                Atividade(0, titulo, descricao, 0);
                widget.bloc.entradaAtividade
                    .add(AdicionarAtividadeEvento(novaAtividade));
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(primary: Colors.blue),
            child: const Text('Adicionar')),
      ),
    );
  }
}
