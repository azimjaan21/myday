import 'package:flutter/material.dart';

import 'package:myday/views/intro/onboard/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'My Day',
      theme: ThemeData(
        fontFamily: 'JosefinSans',
        brightness: Brightness.dark,
      ),
      home: const OnBoardingScreen(),//HomeView(),
    );
  }
}
