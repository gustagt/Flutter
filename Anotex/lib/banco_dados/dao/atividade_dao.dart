import 'package:anotex/banco_dados/app_banco_dados.dart';
import 'package:anotex/modelo/atividade.dart';
import 'package:sqflite/sqflite.dart';

class AtividadeDao {
  static const String tabelaSql = 'CREATE TABLE $_nomeTabela ('
      '$_id INTEGER PRIMARY KEY, '
      '$_titulo TEXT, '
      '$_descricao TEXT, '
      '$_estado INTEGER)';

  static const String _nomeTabela = 'atividade';
  static const String _id = 'id';
  static const String _titulo = 'titulo';
  static const String _descricao = 'descricao';
  static const String _estado = 'estado';

  Future<int> salvar(Atividade atividade) async {
    final Database db = await criarBancoDados();
    Map<String, dynamic> atividadeMap = _toMap(atividade);
    return db.insert(_nomeTabela, atividadeMap);
  }

  Future<List<Atividade>> listarTodos() async {
    final Database db = await criarBancoDados();
    final List<Map<String, dynamic>> resultados = await db.query(_nomeTabela);
    List<Atividade> listaAtividades = _toLista(resultados);
    return listaAtividades;
  }

  Future<int> editar(Atividade atividade) async {
    final Database db = await criarBancoDados();
    final Map<String, dynamic> atividadeMap = _toMap(atividade);
    return db.update(_nomeTabela, atividadeMap,
        where: '$_id = ?', whereArgs: [atividade.id]);
  }

  Future<int> deletar(int id) async {
    final Database db = await criarBancoDados();
    return db.rawDelete("DELETE FROM $_nomeTabela WHERE $_id = $id");
  }

  Map<String, dynamic> _toMap(Atividade atividade) {
    final Map<String, dynamic> atividadeMap = {};
    atividadeMap[_titulo] = atividade.titulo;
    atividadeMap[_descricao] = atividade.descricao;
    atividadeMap[_estado] = atividade.estado;
    return atividadeMap;
  }

  List<Atividade> _toLista(List<Map<String, dynamic>> resultados) {
    final List<Atividade> listaAtividades = [];
    for (Map<String, dynamic> linha in resultados) {
      final Atividade atividade = Atividade(
        linha[_id],
        linha[_titulo],
        linha[_descricao],
        linha[_estado],
      );
      listaAtividades.add(atividade);
    }
    return listaAtividades;
  }
}
