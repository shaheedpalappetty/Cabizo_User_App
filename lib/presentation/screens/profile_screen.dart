// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:taxi_app_user/presentation/screens/edit_profile.dart';
import 'package:taxi_app_user/presentation/screens/privacy_policy_screen.dart';
import 'package:taxi_app_user/presentation/screens/terms_condition_screen.dart';
import 'package:taxi_app_user/presentation/widget/common/custom_tile.dart';
import 'package:taxi_app_user/service/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * .35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user!.fullname,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "urbanist"),
                ),
                Text(
                  user!.phonenumber.toLowerCase(),
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: "urbanist"),
                )
              ],
            ),
          ),
          CustomTile(
              pageRoute: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PrivacyPolicy())),
              leadingIcon: const Icon(Icons.lock),
              title: "Privacy policy"),
          CustomTile(
              pageRoute: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TermsConditionScreen())),
              leadingIcon: const Icon(Icons.info_outline),
              title: "Terms & Conditions"),
          CustomTile(
              pageRoute: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditPage(
                        user: user!,
                      ))),
              leadingIcon: const Icon(Icons.edit),
              title: "Edit Profile"),
          const CustomTile(
              leadingIcon: Icon(Icons.delete),
              title: "Delete Account",
              isDailogue: true),
          const CustomTile(
            leadingIcon: Icon(
              Icons.login,
              color: Colors.red,
            ),
            title: "LogOut",
            isDailogue: true,
          ),
        ],
      ),
    ));
  }
}
