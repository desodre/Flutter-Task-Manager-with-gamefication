import 'package:aula/Screens/form_screen.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: ElevatedButton(
          child: const Text('Button label'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormScreen(
                  taskContext: context,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
