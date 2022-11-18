import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poo_flutter/components/colors_dot.dart';
import 'package:poo_flutter/database/category_database/dao/category_service.dart';
import 'package:poo_flutter/database/task_database/dao/task_service.dart';
import 'package:poo_flutter/models/task.dart';
import 'package:poo_flutter/themes/theme_colors.dart';
import 'package:intl/intl.dart';

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
  void initState() {
    super.initState();
    _loadCategories();
  }

  _loadCategories() async {
    final categoryService = CategoryService();
    final categories = await categoryService.findAll();
    for (var category in categories) {
      setState(() {
        _categories.add(
          DropdownMenuItem(
            value: category.name,
            child: Row(
              children: [
                ColorDot(color: ThemeColors.colorDotCategoryAndTask[category.name]),
                const SizedBox(
                  width: 10,
                ),
                Text(category.name),
              ],
            ),
          ),
        );
      });
    }
  }

  DateTime _date = DateTime.now();

  _selectTodoDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2099));
    if (pickedDate != null) {
      _date = pickedDate;
      setState(() {
        _todoDate.text = DateFormat("yyyy-MM-dd").format(pickedDate);
      });
    }
  }

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
                  hintText: "Todo title", labelText: "Todo title"),
            ),
            TextField(
              controller: _todoDescription,
              decoration: const InputDecoration(
                  hintText: "Todo description", labelText: "Todo description"),
            ),
            TextField(
              controller: _todoDate,
              decoration: InputDecoration(
                  hintText: "YY-MM-DD",
                  labelText: "YY-MM-DD",
                  prefixIcon: InkWell(
                      onTap: () => _selectTodoDate(context),
                      child: const Icon(Icons.calendar_today))),
            ),
            DropdownButtonFormField(
              value: _selectedValue,
              items: _categories,
              hint: const Text("Select one category"),
              onChanged: (value) {
                _selectedValue = value;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    final task = Task(
                        Random().nextInt(100),
                        _todoTitle.text,
                        _todoDescription.text,
                        _selectedValue,
                        _todoDate.text,
                        0);
                    TaskService().save(task).then((value) => Navigator.pop(context));
                  },
                  child: const Text("Save"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
