import 'package:poo_flutter/database/connection_db.dart';
import 'package:poo_flutter/models/category.dart';

class CategoryService {
  Future<int> save(Category category) {
    return connectionDB().then((db) {
      final Map<String, dynamic> categoryMap = {
        'id': category.id,
        'name': category.name,
        'description': category.description
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

  Future<int> deleteCategory(Category category) async {
    return connectionDB().then((db) {
      return db.delete("categories", where: "id = ${category.id}");
    });
  }

  Future<int>update(category) async {
    return await connectionDB().then((db) {
      final Map<String, dynamic> categoryMap = {
        'id': category.id,
        'name': category.name,
        'description': category.description
      };
      return db.update(
          "categories",
          categoryMap,
          where: "id = ?",
        whereArgs: [category.id]
      );
    });
  }
}
