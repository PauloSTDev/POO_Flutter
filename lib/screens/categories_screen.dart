import 'package:flutter/material.dart';
import 'package:poo_flutter/screens/home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  _showFormInDialog(BuildContext context) {
    return showDialog(context: context, builder: (param) {
      return AlertDialog(
        actions: [
          TextButton(onPressed: () {}, child: Text("Save")),
          TextButton(onPressed: () {}, child: Text("Cancel")),

        ],
        title: const Text("Category form"),
        content: SingleChildScrollView(
          child: Column(
            children: const [
              TextField(
                decoration: InputDecoration(
                  labelText: "Category name",
                  hintText: "Write Category name",
                ),
              ),
              TextField(
                decoration: InputDecoration(
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
