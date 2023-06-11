import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/plan1.png'),
          ),
         const Text(
            'Plan Seamlessly',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
         const SizedBox(height: 13,),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 18,
              ),
              children: [
                TextSpan(
                  text: 'Get your work done seamlessly \n               with a daily plan',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
