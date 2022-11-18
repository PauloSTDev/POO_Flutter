import 'package:flutter/material.dart';
import 'package:poo_flutter/components/colors_dot.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String description;
  final ColorDot icon;
  //final Future<dynamic> function;

  const MyCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.icon,
      //required this.function
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          //function;
        },
        leading: icon,
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}
