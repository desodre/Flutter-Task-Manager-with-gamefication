import 'package:aula/data/task_inherited.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Nova Task',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.maxFinite,
              height: 650,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.lightBlue)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        label: Text("Nome da Task"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Preencha o Nome";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      decoration: const InputDecoration(
                        label: Text("Dificuldade"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return "Preencha a dificuldade";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: imageController,
                      decoration: const InputDecoration(
                        label: Text("Link da Imagem"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Preencha a Imagem";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 2, color: Colors.purpleAccent)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageController.text,
                          errorBuilder: (context, error, stackTrace) {
                            return Container();
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('Button label'),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          // nameController.clear();
                          // difficultyController.clear();
                          // imageController.clear();
                          TaskInherited.of(widget.taskContext).addNewTask(
                              TaskName: nameController.text,
                              Image: imageController.text,
                              dificuldade:
                                  int.parse(difficultyController.text));

                          print(TaskInherited.of(widget.taskContext).taskList);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Column(
                                children: [
                                  const Text(
                                      "Os seguindes dados foram salvos: "),
                                  Text(
                                      "${nameController.text} ${difficultyController.text}"),
                                ],
                              ),
                            ),
                          );
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                              dismissDirection: DismissDirection.up,
                              content: Text("Os Campos não podem ser vazios!!"),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
