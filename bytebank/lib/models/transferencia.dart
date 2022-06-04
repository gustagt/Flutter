


class Transferencia {
  final double? valor;
  final int? numConta;

  @override
  String toString() {
    return 'Transferencia{_valor: $valor, _numConta: $numConta}';
  }

  Transferencia(this.valor, this.numConta);
}