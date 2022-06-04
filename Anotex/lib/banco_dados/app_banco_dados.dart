import 'package:anotex/banco_dados/dao/atividade_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> criarBancoDados() async {
  final String path = join(await getDatabasesPath(), 'Anotex.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(AtividadeDao.tabelaSql);
  }, version: 1,
      //onDowngrade: onDatabaseDowngradeDelete
      );
}

