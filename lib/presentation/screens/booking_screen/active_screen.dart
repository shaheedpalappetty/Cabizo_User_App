import 'package:flutter/material.dart';

class ActiveTabbar extends StatelessWidget {
  const ActiveTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 238, 238),  
        body: Center(
          child: Text("No active trips"),
        )
        );
  }
}
