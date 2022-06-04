import 'package:anotex/modelo/atividade.dart';

abstract class AtividadeEstado {
  List<Atividade> atividades;

  AtividadeEstado(this.atividades);
}

class AtividadeEstadoInicial extends AtividadeEstado {
  AtividadeEstadoInicial() : super([]);
}

class AtividadeEstadoSucesso extends AtividadeEstado {
  AtividadeEstadoSucesso(List<Atividade> atividades) : super(atividades);
}
