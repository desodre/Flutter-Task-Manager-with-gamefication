import 'package:flutter/material.dart';
import 'package:aula/components/Dificulty.dart';

//ignore: must_be_immutable
class TaskOverAll extends StatefulWidget {
  final String _taskName;
  final String foto;
  final int dificuldade;
  int nivel = 0;

  TaskOverAll(
      {super.key,
      required String taskName,
      required this.foto,
      required this.dificuldade})
      : _taskName = taskName;

  @override
  State<TaskOverAll> createState() => _TaskOverAllState();
}

class _TaskOverAllState extends State<TaskOverAll> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: widget.nivel < 10
                    ? Colors.blue
                    : widget.nivel < 20
                        ? Colors.amber
                        : widget.nivel < 30
                            ? Colors.green
                            : Colors.black,
              ),
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.circular(5),
                          ),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        child: widget.foto.contains("http")
                            ? Image.network(widget.foto)
                            : Image.asset(
                                widget.foto.contains("/")
                                    ? widget.foto
                                    : "assets/images/flutter_mascote.png",
                                fit: BoxFit.cover,
                              ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text(
                              widget._taskName,
                              style: const TextStyle(fontSize: 22),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Dificulty(
                            dificultyNumber: widget.dificuldade,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                            });
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_drop_up_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "Up",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: widget.dificuldade > 0
                              ? (widget.nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Nivel: ${widget.nivel}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
