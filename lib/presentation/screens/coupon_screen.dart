// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:taxi_app_user/presentation/widget/coupon_widget.dart/coupons_tile.dart';
import 'package:taxi_app_user/presentation/widget/coupon_widget.dart/custom_pop_message.dart';

class CouponScreen extends StatelessWidget {
  CouponScreen({super.key});
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Coupons',
          style: TextStyle(fontFamily: "urbanist", fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CouponTile(onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CustomPopupMessgae();
                    },
                  );
                }));
          }),
    );
  }
}
