import 'package:aula/Screens/form_screen.dart';
import 'package:aula/data/task_inherited.dart';
import 'package:flutter/material.dart';

class HomeWindow extends StatefulWidget {
  const HomeWindow({super.key});

  @override
  State<HomeWindow> createState() => _HomeWindowState();
}

class _HomeWindowState extends State<HomeWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.integration_instructions,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          "Tarefas",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.blue,
        child: IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (taskwindowcontext) =>
                    FormScreen(taskContext: context),
              ),
            );
          },
          disabledColor: Colors.blue,
          focusColor: Colors.blue,
          color: Colors.blue,
          highlightColor: Colors.blue,
          hoverColor: Colors.blue,
          splashColor: Colors.blue,
        ),
      ),
    );
  }
}
