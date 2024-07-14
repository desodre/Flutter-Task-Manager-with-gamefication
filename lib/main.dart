import 'package:aula/data/task_inherited.dart';
import 'package:flutter/material.dart';
import 'package:aula/Screens/taskwindow.dart';

void main() {
  runApp(const MainWindow());
}

// ignore: must_be_immutable
class MainWindow extends StatelessWidget {
  const MainWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Apresentation",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskInherited(child: const HomeWindow()),
    );
  }
}
