import 'package:anotex/blocs/atividade_bloc.dart';
import 'package:anotex/blocs/atividade_evento.dart';
import 'package:anotex/modelo/atividade.dart';
import 'package:flutter/material.dart';

class EditarAtividade extends StatelessWidget {
  final Atividade atividade;

  final AtividadeBloc bloc;

  const EditarAtividade(this.atividade, this.bloc, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController crotoladorTitulo =
    TextEditingController(text: atividade.titulo);
    final TextEditingController crotoladorDescricao =
    TextEditingController(text: atividade.descricao);

    return Scaffold(
      appBar: AppBar(title: const Text('Editar Atividade')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(children: [
            TextField(
              controller: crotoladorTitulo,
              decoration: const InputDecoration(
                labelText: 'Titulo da Atividade',
              ),
              style: const TextStyle(fontSize: 22.0),
            ),
            TextField(
              controller: crotoladorDescricao,
              maxLines: null,
              decoration: const InputDecoration(labelText: 'Descrição'),
              style: const TextStyle(fontSize: 20.0),
            ),
            _botaoEditar(crotoladorTitulo, crotoladorDescricao, context)
          ]),
        ),
      ),
    );
  }

  SizedBox _botaoEditar(TextEditingController crotoladorTitulo,
      TextEditingController crotoladorDescricao, BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ElevatedButton(
            onPressed: () {
              final String titulo = crotoladorTitulo.text;
              final String descricao = crotoladorDescricao.text;
              if (titulo != '') {
                final Atividade atividadeEditada = Atividade(
                    atividade.id, titulo, descricao, atividade.estado);
                bloc.entradaAtividade
                    .add(EditarAtividadeEvento(atividadeEditada));
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(primary: Colors.blue),
            child: const Text('Editar')),
      ),
    );
  }
}
