import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../login_screen.dart';

class SecondIndroScreen extends StatelessWidget {
  const SecondIndroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 30),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
          },
          backgroundColor: Appcolor.primaryColor,
          child: const Icon(
            Icons.keyboard_arrow_right,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
                    width: 350,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("asset/image/indro2.png"))),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Let's make your day great with Taxio right now",
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.highboldTxtStyle,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .20,
              child: Column(
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Continue and join now',
                        textStyle: CustomTextStyle.swipeTextStyle,
                        speed: const Duration(milliseconds: 90),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 1000),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
