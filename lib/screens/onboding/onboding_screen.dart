import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import '../../components/Signinform.dart';
import '../../components/animatedButton.dart';
import '../../components/custom_sign_in_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSigninDialogShown = false;
  late RiveAnimationController _btnanimationController;

  @override
  void initState() {
    _btnanimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            //height: 100,
            width: MediaQuery.of(context).size.width * 1.6,
            bottom: 200,
            left: 100,
            child: Image.asset(
              "assets/Backgrounds/Spline.png",
            )),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 18,
            sigmaY: 10,
          ),
        )),
        const RiveAnimation.asset(
          "assets/RiveAssets/shapes.riv",
        ),
        // Adding blur
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 30,
            sigmaY: 30,
          ),
          child: const SizedBox(),
        )),
        //Adding Text
        AnimatedPositioned(
          top: isSigninDialogShown ? -50 : 0,
          duration: const Duration(milliseconds: 240),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 260,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Learn \ndesign & code",
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: "Poppins",
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Don't skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                      ),
                      SizedBox(height: 200),
                    ],
                  ),
                ),
                //Adding Butt

                AnimatedButton(
                  btnanimationController: _btnanimationController,
                  press: () {
                    _btnanimationController.isActive = true;
                    Future.delayed(
                      const Duration(milliseconds: 800),
                      () {
                        setState(() {
                          isSigninDialogShown = true;
                        });
                        GeneralSignInDialog(
                          context,
                          onClosed: (_) {
                            setState(() {
                              isSigninDialogShown = false;
                            });
                          },
                        );
                      },
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 26, horizontal: 10),
                  child: Text(
                      "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                ),
              ],
            ),
          )),
        )
      ],
    ));
  }
}
