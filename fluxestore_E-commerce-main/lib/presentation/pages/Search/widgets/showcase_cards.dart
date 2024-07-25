
import 'package:flutter/material.dart';

class ShowcaseItemcards extends StatelessWidget {
  const ShowcaseItemcards({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        width: 311,
                        height: 126,
                        decoration: BoxDecoration(
                            color: const Color(0xffA3A798),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text("CLOTHING",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 126,
                              width: 200,
                              child: Column(
                                children: [
                                  Stack(
                                    fit: StackFit.passthrough,
                                    alignment: Alignment.center,
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Color(0xFFB2B7A7),
                                        radius: 55,
                                      ),
                                      const CircleAvatar(
                                        backgroundColor: Color(0XffC2C7B5),
                                        radius: 40,
                                      ),
                                      Positioned(
                                        // top: 5,
                                        // left: 5,
                                        // right: 30,
                                        child: Image.asset(
                                          // height: 100,
                                          "assets/images/search1.png",
                                          // assets\images\search_recomend_banner1.png
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        width: 311,
                        height: 126,
                        decoration: BoxDecoration(
                            color: const Color(0xff898280),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text("ACCESSORIES",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Color(0xFF938B89),
                                      radius: 55,
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Color(0Xff9C9492),
                                      radius: 40,
                                    ),
                                    Image.asset(
                                      height: 80,
                                      "assets/images/search2.png",
                                      // assets\images\search_recomend_banner1.png
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        width: 311,
                        height: 126,
                        decoration: BoxDecoration(
                            color: const Color(0xff44565C),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("SHOES",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Color(0xFF4F636A),
                                      radius: 55,
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Color(0Xff5B7178),
                                      radius: 40,
                                    ),
                                    Image.asset(
                                      height: 120,
                                      "assets/images/search3.png",
                                      // assets\images\search_recomend_banner1.png
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        width: 311,
                        height: 126,
                        decoration: BoxDecoration(
                            color: const Color(0xffB9AEB2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("COLLECTIONS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Color(0xFFC7BEC2),
                                      radius: 55,
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Color(0XffD1CACD),
                                      radius: 40,
                                    ),
                                    Image.asset(
                                      height: 126,
                                      "assets/images/search4.png",
                                      // assets\images\search_recomend_banner1.png
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
  }
}