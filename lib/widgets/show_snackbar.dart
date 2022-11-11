import 'package:flutter/material.dart';

showSnackBar(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("Erro ao tentar $message",
        textAlign: TextAlign.center, style: const TextStyle(fontSize: 24)),
    duration: const Duration(seconds: 5),
    backgroundColor: Colors.red,
  ));
}