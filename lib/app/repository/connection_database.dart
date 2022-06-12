import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'scripts/livro_script.dart';

class ConectionDatabase {
  static Database? _db;

  static Future<Database?> get() async {
    if (_db != null) {
      return _db;
    } else {
      try {
        var path = join(await getDatabasesPath(), 'marcaPaginas.db');
        _db = await openDatabase(path, version: 1, onCreate: (db, v) {
          db.execute(createTableLivro);
        });

        return _db;
      } catch (e) {
        print(e);
      }
    }
  }
}
