// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class BulletText extends StatelessWidget {
  const BulletText({super.key,required this.text});
  final String  text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: SizedBox(
              width: 8,
              height: 8,
              child: CircleAvatar(
                backgroundColor: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontFamily: "urbanist", fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
