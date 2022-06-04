class Contacts {
  final int id;
  final String nome;
  final int? numeroConta;

  Contacts(this.id, this.nome, this.numeroConta);

  @override
  String toString() {
    return 'Contacts{id $id, nome: $nome, numeroConta: $numeroConta}';
  }
}