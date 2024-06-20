import 'package:flutter/material.dart';

class Dificulty extends StatelessWidget {
  final int dificultyNumber;
  const Dificulty({
    super.key,
    required this.dificultyNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            color: dificultyNumber >= 1 ? Colors.blue : Colors.blue[100],
            size: 15),
        Icon(Icons.star,
            color: dificultyNumber >= 2 ? Colors.blue : Colors.blue[100],
            size: 15),
        Icon(Icons.star,
            color: dificultyNumber >= 3 ? Colors.blue : Colors.blue[100],
            size: 15),
        Icon(Icons.star,
            color: dificultyNumber >= 4 ? Colors.blue : Colors.blue[100],
            size: 15),
        Icon(Icons.star,
            color: dificultyNumber >= 5 ? Colors.blue : Colors.blue[100],
            size: 15),
      ],
    );
  }
}
