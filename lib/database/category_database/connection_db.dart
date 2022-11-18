import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> connectionDB() async {
  var databasesPath = await getDatabasesPath();
  String tableSql =
      'CREATE TABLE categories('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'description TEXT)';
  final String path = join(databasesPath, "categories.db");
  return openDatabase(path, onCreate: (db, version) {
    db.execute(tableSql);
  },
  version: 1,
  );
}
