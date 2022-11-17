import 'package:poo_flutter/database/task_database/dao/task_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> taskConnectionDB() async {

  var databasesPath = await getDatabasesPath();
  String tableSql = 'CREATE TABLE ${TaskService.table}('
      'id INTEGER PRIMARY KEY, '
      'title TEXT, '
      'description TEXT, '
      'category TEXT, '
      'todoDate TEXT, '
      'isFinished INTEGER)';
  final String path = join(databasesPath, "${TaskService.table}.db");
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(tableSql).catchError((onError) {
        print("Deu errado");
      }).then((value) => print("Deu certo"));
    },
    version: 1,
  );
}
