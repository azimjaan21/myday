import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/boost.png'),
          ),
         const Text(
            'Boost Productivity',
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
                  text: ' MyDay ', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.amber,),
                ),
                TextSpan(
                  text: 'helps you boost your productivity \n                    on a different level',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
