// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:taxi_app_user/presentation/screens/bottam_sheet.dart';
import 'package:taxi_app_user/presentation/screens/login_screen.dart';
import 'package:taxi_app_user/presentation/screens/welcome_screens/swipe_screen.dart';
import 'package:taxi_app_user/service/repository.dart';

import '../../service/sharedpref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    validatorDriver();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/image/zippy-routes-logo.png'))),
          width: MediaQuery.of(context).size.width * 2 / 3,
          height: MediaQuery.of(context).size.height * 1 / 4,
        ),
      ),
    );
  }

  void validatorDriver() async {
    final userDetail = Sharedpref.instence.getAuthDetails();
    if (userDetail != null) {
      final data =
          await Repo.userSignin(userDetail['email'], userDetail['password']);
      if (data != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => CustomBottamSheet(
                  user: data,
                )));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Swipepage()));
    }
  }
}
