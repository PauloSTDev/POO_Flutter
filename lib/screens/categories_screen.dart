import 'dart:math';
import 'package:flutter/material.dart';
import 'package:poo_flutter/database/dao/category_service.dart';
import 'package:poo_flutter/models/category.dart';
import 'package:poo_flutter/screens/category_edit_screen.dart';
import 'package:poo_flutter/screens/home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final categoryNameController = TextEditingController();
  final categoryDescriptionController = TextEditingController();

  showFormInDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () async {
                    final category = Category(
                        Random().nextInt(100),
                        categoryNameController.text,
                        categoryDescriptionController.text);
                    print(category);
                    CategoryService().save(category);
                    Navigator.of(context).pop(context);
                    setState(() {});
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
                    controller: categoryNameController,
                    decoration: const InputDecoration(
                      labelText: "Category name",
                      hintText: "Write Category name",
                    ),
                  ),
                  TextField(
                    controller: categoryDescriptionController,
                    decoration: const InputDecoration(
                      labelText: "Category description",
                      hintText: "Write Category description",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        barrierDismissible: true);
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
              if (categories.isNotEmpty) {
                final Category category = categories[index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryEditScreen(
                              category: category,
                              name: category.name,
                              description: category.description
                          ),
                        ),
                      ).then((value) => setState((){print("Recarregando");}));
                    },
                    trailing: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
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
                                        CategoryService()
                                            .deleteCategory(category).then((value) => setState(() {
                                          Navigator.of(context).pop(context);
                                        }));
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
              return const Center(
                child: Text("Erro desconhecido"),
              );
            },
            itemCount: categories!.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showFormInDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
