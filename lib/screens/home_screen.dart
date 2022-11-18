import 'package:flutter/material.dart';
import 'package:poo_flutter/components/colors_dot.dart';
import 'package:poo_flutter/database/task_database/dao/task_service.dart';
import 'package:poo_flutter/models/task.dart';
import 'package:poo_flutter/themes/theme_colors.dart';
import 'package:poo_flutter/widgets/drawer.dart';
import 'package:poo_flutter/widgets/my_card.dart';

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
        title: const Text("Home - POO Flutter"),
      ),
      drawer: const DrawerNavigation(),
      body: FutureBuilder<List<Task>>(
        initialData: const [],
        future: TaskService().findAll(),
        builder: (context, snapshot) {
          List<Task>? tasks = snapshot.data;
          return ListView.builder(
            itemCount: tasks?.length,
            itemBuilder: (context, index) {
              if (tasks != null) {
                final Task task = tasks[index];
                return MyCard(
                  //function: navigateAndUpdate(context, task).then((value) => setState(() {})),
                  title: task.title,
                  description: task.description,
                  icon: ColorDot(
                    color: ThemeColors.colorDotCategoryAndTask[task.category],
                  ),
                );
              } else {
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
