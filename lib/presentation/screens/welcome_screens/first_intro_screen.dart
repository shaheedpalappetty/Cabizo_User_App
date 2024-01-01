import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_text_styles.dart';


class FirstIntroScreen extends StatelessWidget {
  const FirstIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            image: AssetImage("asset/image/indro1.png"))),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'We provide professional taxi services for you',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.highboldTxtStyle,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .20,
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Swipe and Continue...',
                    textStyle: CustomTextStyle.swipeTextStyle,
                    speed: const Duration(milliseconds: 90),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 1000),
              ),
            )
          ],
        ),
      ),
    );
  }
}
