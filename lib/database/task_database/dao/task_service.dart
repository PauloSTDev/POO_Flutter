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

  Future<List<Task>> findAll() {
    return taskConnectionDB().then((db) {
      return db.query(table).then((maps) {
        final List<Task> tasks = [];
        for (Map<String, dynamic> map in maps) {
          final Task task = Task(
            map["id"],
            map["title"],
            map["description"],
            map["category"],
            map["todoDate"],
            map["isFinished"],
          );
          tasks.add(task);
        }
        return tasks;

      });
    });
  }
}
