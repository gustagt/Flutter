class Atividade {
  final int id;
  final String titulo;
  final String descricao;
  int estado;

  Atividade(this.id, this.titulo, this.descricao, this.estado) : assert (titulo != '' && (estado == 0 || estado == 1));

  @override
  String toString() {
    return 'Atividade{id: $id, nome: $titulo, descri: $descricao, estado: $estado}';
  }
}
