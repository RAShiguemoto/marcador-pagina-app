import 'package:marca_pagina_app/app/model/livro_model.dart';
import 'package:sqflite/sqflite.dart';

import 'connection_database.dart';

class LivroRepository {
  Database? _db;

  Future<List<Livro>> find() async {
    _db = await ConectionDatabase.get();

    if (_db != null) {
      var sql = 'SELECT * FROM livro ORDER BY nome ASC';
      List<Map<String, dynamic>> result = await _db!.rawQuery(sql, []);
      List<Livro> lista = List.generate(result.length, (index) {
        var linha = result[index];

        Livro livro = Livro();
        livro.id = linha['id'];
        livro.nome = linha['nome'];
        livro.capitulo = linha['capitulo'];
        livro.pagina = linha['pagina'];
        return livro;
      });

      return lista;
    }

    return <Livro>[];
  }

  Future<bool> _findId(int? codLivro) async {
    _db = await ConectionDatabase.get();

    if (_db != null) {
      var sql = 'SELECT * FROM livro WHERE id = ?';
      List<Map<String, dynamic>> result = await _db!.rawQuery(sql, [codLivro]);

      if (result.isNotEmpty) {
        return true;
      }

      return false;
    }

    return false;
  }

  save(Livro livro) async {
    _db = await ConectionDatabase.get();

    if (_db != null) {
      var sql;
      if (livro.id == null) {
        sql = 'INSERT INTO livro(nome, capitulo, pagina) VALUES (?,?,?)';
        _db!.rawInsert(sql, [livro.nome, livro.capitulo, livro.pagina]);
      } else {
        sql =
            'UPDATE livro SET nome = ?, capitulo = ?, pagina = ? WHERE id = ?';
        _db!.rawUpdate(
            sql, [livro.nome, livro.capitulo, livro.pagina, livro.id]);
      }
    }
  }
}
