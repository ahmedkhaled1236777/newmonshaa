import 'package:flutter/material.dart';

class leadingappbar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scafoldstate;

  const leadingappbar({super.key, required this.scafoldstate});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        scafoldstate.currentState!.openDrawer();
      },
      icon: Icon(
        Icons.menu,
        color: Colors.white,
      ),
    );
  }
}
