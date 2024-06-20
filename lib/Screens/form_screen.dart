import 'package:flutter/material.dart';
import 'package:animated_hint_textfield/animated_hint_textfield.dart';

class FormScreen extends StatefulWidget {
  FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController difficulty_controller = TextEditingController();
  TextEditingController image_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nota Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.lightBlue)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                AnimatedTextField(
                  controller: name_controller,
                  animationType: Animationtype.slide,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.work_outline_rounded),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(4)),
                      contentPadding: const EdgeInsets.all(12)),
                  hintTexts: const [
                    "Colorca seu nome",
                    "Seu nome ai vei",
                    "Aqui meu rei"
                  ],
                ),
                AnimatedTextField(
                  controller: difficulty_controller,
                  animationType: Animationtype.slide,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.numbers),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(4)),
                      contentPadding: const EdgeInsets.all(12)),
                  hintTexts: const [
                    "Dificuldade",
                    "Dificuldade ai vei",
                    "Mt dificil n prff"
                  ],
                ),
                AnimatedTextField(
                  controller: image_controller,
                  animationType: Animationtype.slide,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.image),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(4)),
                      contentPadding: const EdgeInsets.all(12)),
                  hintTexts: const [
                    "Link da imagi vei",
                    "Meu dog ta pedindo o link KKK",
                    "A imagi ai vei"
                  ],
                ),
                ElevatedButton(
                  child: const Text('Button label'),
                  onPressed: () {
                    debugPrint(difficulty_controller.text);
                    debugPrint(name_controller.text);
                    debugPrint(image_controller.text);
                    name_controller.clear();
                    difficulty_controller.clear();
                    image_controller.clear();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
