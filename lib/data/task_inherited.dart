import 'package:flutter/material.dart';
import 'package:aula/Components/taskoverall.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<TaskOverAll> taskList = [
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
  ];

  void addNewTask(
      {required String TaskName,
      required String Image,
      required int dificuldade}) {
    print("O tamanho da TaskList é ${TaskName.length}");
    final TaskOverAll TOA =
        TaskOverAll(taskName: TaskName, foto: Image, dificuldade: dificuldade);
    taskList.add(TOA);
    print("Agora tamanho da TaskList é ${TaskName.length}");
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
