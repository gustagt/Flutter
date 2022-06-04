import 'package:anotex/modelo/atividade.dart';
import 'package:anotex/telas/tela_inicial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Deve haver o botao quando a telaPrincipal for aberta',
          (widgetTester) async {
        await widgetTester.pumpWidget(MaterialApp(home: TelaInicial()));
        final botaoAdicionar = find.byType(FloatingActionButton);
        expect(botaoAdicionar, findsOneWidget);
      });
  testWidgets('Deve haver uma lista quando a telaPrincipal for aberta',
          (widgetTester) async {
        await widgetTester.pumpWidget(MaterialApp(home: TelaInicial()));
        final lista = find.byType(ListView);
        debugPrint(lista.toString());
        expect(lista, findsOneWidget);
      });

  test('O estado atual for 0 deve retornar um icone check', () {
    final icon = TelaInicialState()
        .estadoAtual(Atividade(0, 'Augusto', 'Grande amigo', 0));
    final iconResultado = Icon(Icons.check);
    expect(icon.toString(), iconResultado.toString());
  });
  test('O estado atual for 1 deve retornar um icone check green', () {
    final icon = TelaInicialState()
        .estadoAtual(Atividade(0, 'Augusto', 'Grande amigo', 1));
    final iconResultado = Icon(Icons.check, color: Colors.green);
    expect(icon.toString(), iconResultado.toString());
  });


}
