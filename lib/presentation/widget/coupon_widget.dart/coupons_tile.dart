import 'package:flutter/material.dart';

class CouponTile extends StatelessWidget {
  const CouponTile({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const SizedBox(
        child: Stack(
          children: [
            Positioned(
              bottom: 5,
              left: 15,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 146, 117, 29),
                radius: 3,
              ),
            ),
            Positioned(
              right: 10,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 200, 159, 37),
                radius: 3,
              ),
            ),
            Positioned(
              bottom: 10,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 218, 178, 58),
                radius: 6,
              ),
            ),
            Positioned(
              top: 10,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 144, 121, 51),
                radius: 2,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 188, 154, 51),
                radius: 7,
              ),
            ),
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 255, 197, 7),
              radius: 40,
              child: Icon(
                Icons.card_giftcard,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      title: const Text(
        'Special 25% off',
        style: TextStyle(
            fontFamily: "urbanist", fontWeight: FontWeight.bold, fontSize: 19),
      ),
      subtitle: const Text(
        'Special promo only today',
        style: TextStyle(fontFamily: "urbanist"),
      ),
    );
  }
}
