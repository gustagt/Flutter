import 'package:anotex/blocs/atividade_bloc.dart';
import 'package:anotex/blocs/atividade_estado.dart';
import 'package:anotex/blocs/atividade_evento.dart';
import 'package:anotex/modelo/atividade.dart';
import 'package:anotex/telas/editar_atividade.dart';
import 'package:anotex/telas/form_descricao.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial( {Key? key}) : super(key: key);
  @override
  State<TelaInicial> createState() => TelaInicialState();
}

class TelaInicialState extends State<TelaInicial> {
  late final AtividadeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = AtividadeBloc();
    bloc.entradaAtividade.add(CarregarAtividadeEvento());
  }

  @override
  void dispose() {
    bloc.entradaAtividade.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anotações de Atividade'),
      ),
      body: StreamBuilder<AtividadeEstado>(
        stream: bloc.saidaAtividade,
        builder: (context, snapshot) {
          final List<Atividade> listaAtividades =
              snapshot.data?.atividades ?? [];
          return ListarAtividade(listaAtividades);
        },
      ),
      floatingActionButton: BotaoForm(),
    );
  }

  ListView ListarAtividade(List<Atividade> listaAtividades) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Atividade atividade = listaAtividades[index];
        final Icon check = estadoAtual(atividade);
        return Padding(
          padding: const EdgeInsets.only(top: 4.0, right: 8.0, left: 8.0),
          child: Card(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0),
                child: ListTile(
                  title: Text(atividade.titulo),
                  subtitle: Text(
                    atividade.descricao,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  leading: CheckBox(atividade, check),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, right: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BotaoEditar(atividade),
                    BotaoDeletar(atividade),
                  ],
                ),
              )
            ]),
          ),
        );
      },
      itemCount: listaAtividades.length,
    );
  }

  Icon estadoAtual(Atividade atividade) {
    final Icon check;
    if (atividade.estado == 0) {
      check = const Icon(Icons.check);
    } else {
      check = const Icon(Icons.check, color: Colors.green);
    }
    return check;
  }

  Padding BotaoEditar(Atividade atividade) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: Material(
        color: const Color(0xFF424242),
        child: InkWell(
          child: const Icon(Icons.edit),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditarAtividade(atividade, bloc),
              ),
            );
          },
        ),
      ),
    );
  }
  Material BotaoDeletar(Atividade atividade) {
    return Material(
      color: const Color(0xFF424242),
      child: InkWell(
        child: const Icon(Icons.delete_outline),
        onTap: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (a) {
                return AlertDialog(
                  title: const Text('Deletar'),
                  content: const Text('Tem certeza?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Não')),
                    TextButton(
                        onPressed: () {
                          bloc.entradaAtividade
                              .add(RemoverAtividadeEvento(atividade));
                          Navigator.of(context).pop();
                        },
                        child: const Text('Sim')),
                  ],
                );
              });
        },
      ),
    );
  }

  FloatingActionButton BotaoForm() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FormDescricao(bloc)),
        );
      },
      backgroundColor: Colors.black12,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  Material CheckBox(Atividade atividade, Icon check) {
    return Material(
      color: const Color(0xFF424242),
      child: InkWell(
        onTap: () {
          if (atividade.estado == 0) {
            atividade.estado = 1;
          } else {
            atividade.estado = 0;
          }
          bloc.entradaAtividade.add(EditarAtividadeEvento(atividade));
        },
        child: check,
      ),
    );
  }

}