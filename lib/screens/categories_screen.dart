import 'dart:math';
import 'package:flutter/material.dart';
import 'package:poo_flutter/models/category.dart';
import 'package:poo_flutter/repositories/category_service.dart';
import 'package:poo_flutter/screens/home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  final _categoryNameController = TextEditingController();
  final _categoryDescriptionController = TextEditingController();

  _showFormInDialog(BuildContext context) {
    return showDialog(context: context, builder: (param) {
      return AlertDialog(
        actions: [
          TextButton(
              onPressed: () async {
                final category = Category(Random().nextInt(100), _categoryNameController.text, _categoryDescriptionController.text);
                print(category);
                CategoryService().save(category);
                Navigator.of(context).pop(context);
              },
              child: const Text("Save")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(context);
              },
              child: const Text("Cancel")),

        ],
        title: const Text("Category form"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _categoryNameController,
                decoration: const InputDecoration(
                  labelText: "Category name",
                  hintText: "Write Category name",
                ),
              ),
              TextField(
                controller: _categoryDescriptionController,
                decoration: const InputDecoration(
                  labelText: "Category description",
                  hintText: "Write Category description",
                ),
              ),
            ],
          ),
        ),
      );
    }, barrierDismissible: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
        elevation: 0.0,
        title: const Text("Welcome to Category Screen"),
      ),
      body: FutureBuilder<List<Category>>(
        initialData: const [],
        future: CategoryService().findAll(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormInDialog(context);
        },
        child: const Icon(Icons.add),
      ),
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
                        CategoryService().deleteCategory(category);

                        Navigator.of(context).pop(context);
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