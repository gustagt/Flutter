import 'package:anotex/modelo/atividade.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Se deve retornar o mesmo valor do titulo com que foi criado', () {
    final atividade = Atividade(1, 'Fisica', 'Questão 10', 1);
    expect(atividade.titulo, 'Fisica');
  });

  test(
      'Se deve criar uma atividade somente com o titulo preenchido e estado com 0 ou 1',
      () {
    expect(() => Atividade(0, '', 'descricao', 12), throwsAssertionError);
  });

  test(
      'Se deve criar uma atividade somente com o titulo preenchido e estado com 0 ou 1',
      () {
    expect(() => Atividade(0, 'sadasd', 'descricao', 12), throwsAssertionError);
  });

  test(
      'Se deve criar uma atividade somente com o titulo preenchido e estado com 0 ou 1',
      () {
    expect(() => Atividade(0, '', 'descricao', 1), throwsAssertionError);
  });
}
