// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({super.key, required this.text});
  final text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 9),
      child: Text(
        text,
        style: const TextStyle(
            color: Color.fromARGB(255, 57, 57, 57),
            fontSize: 16,
            fontFamily: "urbanist"),
      ),
    );
  }
}
