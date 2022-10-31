import 'dart:math';
import 'package:flutter/material.dart';
import 'package:poo_flutter/models/category.dart';
import 'package:poo_flutter/repositories/connection_db.dart';
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
                save(category);
              },
              child: const Text("Save")),
          TextButton(
              onPressed: () {
                print("Cancel");
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormInDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
