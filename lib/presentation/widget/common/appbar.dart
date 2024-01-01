import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            color: Colors.black,
          )),
      title: const Text(
        'Fill Your Profile',
        style: TextStyle(color: Colors.black, fontFamily: "Urbanist"),
      ),
    );
  }
}
