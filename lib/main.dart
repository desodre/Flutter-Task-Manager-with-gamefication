import 'package:flutter/material.dart';
import 'package:aula/Screens/taskwindow.dart';
import 'package:aula/Screens/form_screen.dart';

void main() {
  runApp(MainWindow());
}

// ignore: must_be_immutable
class MainWindow extends StatelessWidget {
  MainWindow({super.key});

  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Apresentation",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeWindow(),
    );
  }
}
