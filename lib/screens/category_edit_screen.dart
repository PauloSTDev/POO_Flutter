import 'package:flutter/material.dart';
import 'package:poo_flutter/models/category.dart';
import 'package:poo_flutter/repositories/category_service.dart';

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
    final categoryNameController = TextEditingController();
    final categoryDescriptionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Screen"),
        centerTitle: true,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              TextField(
                controller: categoryNameController,
                decoration: InputDecoration(
                  labelText: "Category name",
                  hintText: widget.name,
                ),
              ),
              TextField(
                controller: categoryDescriptionController,
                decoration: InputDecoration(
                  labelText: "Category description",
                  hintText: widget.description,
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
                          await CategoryService()
                              .update(updatedCategory)
                              .then((value) => Navigator.of(context).pop(context));
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
}
