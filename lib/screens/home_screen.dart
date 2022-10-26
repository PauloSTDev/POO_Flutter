import 'package:flutter/material.dart';
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
        title: Text("POO Flutter"),
      ),
      drawer: DrawerNavigation(),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
    );
  }
}
