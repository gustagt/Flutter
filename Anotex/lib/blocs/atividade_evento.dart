import 'package:anotex/modelo/atividade.dart';

abstract class AtividadeEvento {}

class CarregarAtividadeEvento extends AtividadeEvento {}

class AdicionarAtividadeEvento extends AtividadeEvento {
  Atividade atividade;

  AdicionarAtividadeEvento(this.atividade);
}

class RemoverAtividadeEvento extends AtividadeEvento {
  Atividade atividade;

  RemoverAtividadeEvento(this.atividade);
}

class EditarAtividadeEvento extends AtividadeEvento {
  Atividade atividade;

  EditarAtividadeEvento(this.atividade);
}
