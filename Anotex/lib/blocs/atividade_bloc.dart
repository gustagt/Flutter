import 'dart:async';

import 'package:anotex/banco_dados/dao/atividade_dao.dart';
import 'package:anotex/blocs/atividade_estado.dart';
import 'package:anotex/blocs/atividade_evento.dart';
import 'package:anotex/modelo/atividade.dart';

class AtividadeBloc {
  final AtividadeDao _atividadeDd = AtividadeDao();

  final StreamController<AtividadeEvento> _entradaAtividadeControlador =
      StreamController<AtividadeEvento>();
  final StreamController<AtividadeEstado> _saidaAtividadeControlador =
      StreamController<AtividadeEstado>();

  Sink<AtividadeEvento> get entradaAtividade =>
      _entradaAtividadeControlador.sink;

  Stream<AtividadeEstado> get saidaAtividade =>
      _saidaAtividadeControlador.stream;

  AtividadeBloc() {
    _entradaAtividadeControlador.stream.listen(_mapaEventoparaEstado);
  }

  _mapaEventoparaEstado(AtividadeEvento event) async {
    List<Atividade> atividades = [];
    if (event is CarregarAtividadeEvento) {
      atividades = await _atividadeDd.listarTodos();
    } else if (event is AdicionarAtividadeEvento) {
      _atividadeDd.salvar(event.atividade);
      atividades = await _atividadeDd.listarTodos();
    } else if (event is RemoverAtividadeEvento) {
      _atividadeDd.deletar(event.atividade.id);
      atividades = await _atividadeDd.listarTodos();
    } else if (event is EditarAtividadeEvento) {
      _atividadeDd.editar(event.atividade);
      atividades = await _atividadeDd.listarTodos();
    }
    _saidaAtividadeControlador.add(AtividadeEstadoSucesso(atividades));
  }
}
