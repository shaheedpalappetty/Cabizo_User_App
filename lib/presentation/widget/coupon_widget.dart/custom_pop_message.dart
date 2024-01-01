import 'package:flutter/material.dart';
import 'package:taxi_app_user/presentation/widget/coupon_widget.dart/cupon_copy_widget.dart';

class CustomPopupMessgae extends StatelessWidget {
  const CustomPopupMessgae({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text(
        "Special 25% off",
        style: TextStyle(
            fontFamily: 'urbanist', fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            Divider(),
            Text('Special offer Exipired today'),
            CouponCopy(couponId: '#23kjk')
          ],
        ),
      ),
    );
  }
}
