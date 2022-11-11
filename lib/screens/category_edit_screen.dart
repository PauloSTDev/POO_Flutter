import 'package:flutter/material.dart';
import 'package:poo_flutter/database/dao/category_service.dart';
import 'package:poo_flutter/models/category.dart';

class CategoryEditScreen extends StatefulWidget {
  final Category category;
  final String name;
  final String description;

  const CategoryEditScreen(
      {Key? key,
      required this.category,
      required this.name,
      required this.description})
      : super(key: key);

  @override
  State<CategoryEditScreen> createState() => _CategoryEditScreenState();
}

class _CategoryEditScreenState extends State<CategoryEditScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryNameController = TextEditingController(text: widget.name);
    final categoryDescriptionController =
        TextEditingController(text: widget.description);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Screen"),
        centerTitle: true,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              TextField(
                controller: categoryNameController,
                decoration: const InputDecoration(
                  labelText: "Category name",
                ),
              ),
              TextField(
                controller: categoryDescriptionController,
                decoration: const InputDecoration(
                  labelText: "Category description",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                        onPressed: () async {
                          final updatedCategory = Category(
                              widget.category.id,
                              categoryNameController.text,
                              categoryDescriptionController.text);
                          try {
                            await CategoryService()
                                .update(updatedCategory)
                                .catchError((onError) => showSnackBar())
                                .then((value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            content: Text(
                                      "Update Realizado!",
                                      textAlign: TextAlign.center,
                                    ))));
                          } finally {
                            Navigator.of(context).pop(context);
                          }
                        },
                        child: const Text("Save")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "Erro ao tentar editar!",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
      ),
      duration: Duration(seconds: 10),
      backgroundColor: Colors.red,
    ));
  }
}
