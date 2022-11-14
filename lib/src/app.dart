import 'package:flutter/material.dart';
import 'package:poo_flutter/screens/home_screen.dart';
import 'package:poo_flutter/themes/my_themes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme,
      home: const HomeScreen(),
    );
  }
}
