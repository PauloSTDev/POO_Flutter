import 'package:flutter/material.dart';
import 'package:poo_flutter/database/task_database/dao/task_service.dart';
import 'package:poo_flutter/models/task.dart';
import 'package:poo_flutter/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POO Flutter"),
      ),
      drawer: const DrawerNavigation(),
      body: FutureBuilder<List<Task>>(
        initialData: const [],
        future: TaskService().findAll(),
        builder: (context, snapshot){
          List<Task>? tasks = snapshot.data;
          return ListView.builder(
            itemCount: tasks?.length,
              itemBuilder: (context, index){
                if (tasks != null){
                  final Task task = tasks[index];
                  return Card(
                    child: ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.connecting_airports_sharp),
                      title: Text(task.title),
                      subtitle: Text(task.description),
                    ),
                  );
                }
                else {
                  return const CircularProgressIndicator();
                }
              },
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}
