import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CouponCopy extends StatelessWidget {
  final String couponId;

  const CouponCopy({super.key, required this.couponId});

  void _copyToClipboard(BuildContext context) {
    FlutterClipboard.copy(couponId).then((value) {
      Fluttertoast.showToast(
        msg: 'Copied to clipboard',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20.0),
          color: const Color.fromARGB(255, 223, 223, 223),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              couponId,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            IconButton(
              onPressed: () {
                _copyToClipboard(context);
              },
              icon: const Icon(Icons.copy),
            ),
          ],
        ),
      ),
    );
  }
}
