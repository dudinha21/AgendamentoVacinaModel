import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "usuarios.db");

    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );

    return db;
  }

  Future<FutureOr<void>> _onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE usuarios ( id INT PRIMARY KEY AUTO_INCREMENT, nome VARCHAR(200), cpf VARCHAR(14), email VARCHAR(100), local VARCHAR(100), data_nascimento VARCHAR(10), sexo VARCHAR(20), senha VARCHAR(50), numero_cartao_sus INT);';
    await db.execute(sql);

    sql =
        'CREATE TABLE agendamento(id_agendamento INT PRIMARY KEY AUTO_INCREMENT, local_vac VARCHAR(100), dia_vac VARCHAR(20), horario VARCHAR(20), id_usuario INT, CONSTRAINT fk_usuario_agenda FOREIGN KEY(id_usuario) REFERENCES usuarios(id));';
    await db.execute(sql);
  }
}
