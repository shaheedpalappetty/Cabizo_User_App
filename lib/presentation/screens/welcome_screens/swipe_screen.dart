import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taxi_app_user/presentation/screens/welcome_screens/second_intro_screen.dart';

import 'first_intro_screen.dart';

class Swipepage extends StatefulWidget {
  const Swipepage({super.key});

  @override
  State<Swipepage> createState() => _SwipepageState();
}

class _SwipepageState extends State<Swipepage> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: const [
              FirstIntroScreen(),
              SecondIndroScreen(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.96),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 2,
                effect: const WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    type: WormType.thin,
                    activeDotColor: Color.fromARGB(255, 55, 55, 55),
                    dotColor: Color.fromARGB(153, 93, 93, 93)),
              )),
        ],
      ),
    );
  }
}
