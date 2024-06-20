import 'package:aula/Screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:aula/Components/taskoverall.dart';

class HomeWindow extends StatefulWidget {
  const HomeWindow({
    super.key,
  });

  @override
  State<HomeWindow> createState() => _HomeWindowState();
}

class _HomeWindowState extends State<HomeWindow> {
  bool opacity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(
          child: ElevatedButton(
            child: const Text('Button label'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormScreen(),
                ),
              );
            },
          ),
        ),
      ),
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
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: ListView(
          children: const [
            TaskOverAll(
              taskName: "Aprender Fluter",
              foto: 'assets/images/flutter_image.png',
              dificuldade: 4,
            ),
            TaskOverAll(
              taskName: "Aprender Dart",
              foto: 'assets/images/flutter_mascote.png',
              dificuldade: 3,
            ),
            TaskOverAll(
              taskName: "Odio ao Lol",
              foto: 'assets/images/lol_logo.jpg',
              dificuldade: 1,
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        icon: Icon(
            opacity ? Icons.remove_red_eye : Icons.remove_red_eye_outlined),
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
      ),
    );
  }
}
