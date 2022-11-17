import 'package:poo_flutter/database/task_database/task_connection_db.dart';
import 'package:poo_flutter/models/task.dart';

class TaskService {
  static const String table = "tasks";
  Future<int> save(Task task) {
    return taskConnectionDB().then((db) {
      final Map<String, dynamic> taskMap = {
        'id': task.id,
        'title': task.title,
        'description': task.description,
        'category': task.category,
        'todoDate': task.todoDate,
        'isFinished': task.isFinished
      };
      return db.insert(table, taskMap);
    });
  }
}