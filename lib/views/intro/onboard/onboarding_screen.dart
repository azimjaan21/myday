import 'package:flutter/material.dart';
import 'package:myday/views/intro/intro1_screen.dart';
import 'package:myday/views/intro/start_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../intro2_screen.dart';
import '../intro3_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pagecontroller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pagecontroller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          //Page Indicator
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Container(
              alignment: const Alignment(0.0, 0.84),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //skip
                  GestureDetector(
                    onTap: () {
                      pagecontroller.jumpToPage(2);
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

//INDICATORRRRRRRRRRR
                  SmoothPageIndicator(
                    controller: pagecontroller,
                    count: 3,
                    onDotClicked: (index) {
                      pagecontroller.animateToPage(
                        index,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeIn,
                      );
                    },
                  ),

                  //next or done
                  isLastPage
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff2EA3F8),
                                Color(0xff0771BD),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              pagecontroller.animateToPage(
                                3,
                                duration: const Duration(
                                  milliseconds: 500,
                                ),
                                curve: Curves.easeIn,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const GetStartedScreen();
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              'Done',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff2EA3F8),
                                    Color(0xff0771BD),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)),
                          child: GestureDetector(
                            onTap: () {
                              pagecontroller.nextPage(
                                duration: const Duration(
                                  milliseconds: 500,
                                ),
                                curve: Curves.easeIn,
                              );
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
