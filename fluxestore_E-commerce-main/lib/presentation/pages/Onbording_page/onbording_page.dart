import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/scrolling_images.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: -10,
            left: -160,
            child: Row(
              children: [
                ScrollingImages(startingIndex: 0),
                ScrollingImages(startingIndex: 1),
                ScrollingImages(startingIndex: 2),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: h * 0.6,
                width: w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.0),
                      Colors.white.withOpacity(0.5),
                      Colors.white,
                      Colors.white
                    ], begin: Alignment.topCenter, end: Alignment.center)),
                child: Column(
                  children: [
                    const Spacer(),
                    const Text(
                      "Welcome to Fluxstore!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Your Appearance Shows Your Quality",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Change the Quality of your Appearance with MNIML Fashion now.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("Authentication");
                      },
                      child: Container(
                        height: 60,
                        width: w * 0.8,
                        margin: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 70.0),
                              child: Text(
                                "Sign Up with Email",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SvgPicture.asset("assets/images/mail_filled.svg")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}