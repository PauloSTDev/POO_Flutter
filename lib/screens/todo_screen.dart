import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  final _todoTitle = TextEditingController();
  final _todoDate = TextEditingController();
  final _todoDescription = TextEditingController();
  final _categories = <DropdownMenuItem>[];
  var _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _todoTitle,
              decoration: const InputDecoration(
                hintText: "Todo title",
                labelText: "Cook Food"
              ),
            ),
            TextField(
              controller: _todoDescription,
              decoration: const InputDecoration(
                  hintText: "Todo description",
                  labelText: "Cook Rice and Curry"
              ),
            ),
            TextField(
              controller: _todoDate,
              decoration: const InputDecoration(
                  hintText: "YY-MM-DD",
                  labelText: "YY-MM-DD",
                prefixIcon: Icon(Icons.calendar_today)
              ),
            ),
            DropdownButtonFormField(
              value: _selectedValue,
                items: _categories,
                hint: const Text("Select one category"),
                onChanged: (value) {

                },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {}, child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {}, child: const Text("Save"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
