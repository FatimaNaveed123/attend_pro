import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'skipscreen_one.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  late final AnimationController fadeInController =
      AnimationController(duration: const Duration(seconds: 2), vsync: this);

  late final Animation<double> fadeInAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(fadeInController);

  late final AnimationController textAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500), vsync: this);

  late final Animation<double> text1Animation =
      Tween<double>(begin: 0.0, end: 1.0).animate(textAnimationController);

  late final Animation<double> text2Animation =
      Tween<double>(begin: 0.0, end: 1.0).animate(textAnimationController);

  @override
  void dispose() {
    controller.dispose();
    fadeInController.dispose();
    textAnimationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 6),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SkipScreenOne()),
        );
      },
    );

    // Start the fade-in animation after a delay
    Future.delayed(const Duration(seconds: 2), () {
      fadeInController.forward();
    });

    // Start the text animation after a delay
    Future.delayed(const Duration(seconds: 5), () {
      textAnimationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Stack to overlay rotating circle and check sign
            Stack(
              alignment: Alignment.center,
              children: [
                // Rotating circle
                AnimatedBuilder(
                  animation: controller,
                  child: Container(
                    child: Center(
                      child: Image.asset(
                        "images/circle.png",
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: controller.value * 2.0 * pi,
                      child: child,
                    );
                  },
                ),

                // Overlaying check sign
                Positioned(
                  child: FadeTransition(
                    opacity: fadeInAnimation,
                    child: Image.asset(
                      "images/check.png", // Replace with your check sign image path
                      width: 50.0, // Adjust the size as needed
                      height: 50.0,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50.0),

            SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Agne',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('ATTEND PRO'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
