import 'package:flutter/material.dart';
import 'package:poo_flutter/models/category.dart';
import 'package:poo_flutter/repositories/connection_db.dart';
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
      body: FutureBuilder<List<Category>>(
        initialData: const [],
        future: findAll(),
        builder: (context, snapshot) {
          final List<Category>? categories = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              if (categories != null && categories.isNotEmpty) {
                final Category category = categories[index];
                return _CategoryItem(category);
              }
              return const Center(
                child: Text("Erro desconhecido"),
              );
            },
            itemCount: categories?.length,
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;

  const _CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.category),
        trailing: IconButton(
            onPressed: () {
              print("Aham");
              showDialog(context: context, builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Confirm the delete?"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        deleteCategory(category);
                      },
                      child: const Text("Confirm"),
                    ),
                  ],
                );
              });

            },
            icon: const Icon(Icons.delete)),
        title: Text(
          category.name,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          category.description.toString(),
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
