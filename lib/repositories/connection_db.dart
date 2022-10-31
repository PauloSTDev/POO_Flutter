import 'package:poo_flutter/models/category.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


Future<Database> connectionDB() async {
  var databasesPath = await getDatabasesPath();
  String tableSql =
      "CREATE TABLE categories ('id INTEGER PRIMARY KEY', 'name TEXT', 'description TEXT')";
  final String path = join(databasesPath, "database.db");
  return openDatabase(path, onCreate: (db, version) {
    db.execute(tableSql);
  },
  version: 1,
  );
}

Future<int> save(Category category) {
  return connectionDB().then((db) {
    final Map<String, dynamic> categoryMap = {
      'id': category.id,
      'name' : category.name,
      'description' : category.description
    };

    print(categoryMap);
    return db.insert("categories", categoryMap);
  });
}

Future<List<Category>> findAll() {
  return connectionDB().then((db) {
    return db.query('categories').then((maps) {
      final List<Category> categories = [];
      for (Map<String, dynamic> map in maps) {
        final Category category = Category(
          map['id'],
          map['name'],
          map['description'],
        );
        categories.add(category);
      }
      return categories;
    });
  });
}
