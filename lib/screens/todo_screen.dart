import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  final _todoTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Todo"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _todoTitle,
            decoration: InputDecoration(
              hintText: "Todo title",
              labelText: "Cook Food"
            ),
          )
        ],
      ),
    );
  }
}
