import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/achievereal.png'),
          ),
         const Text(
            'Achieve Higher Goals',
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
                  text: 'Clear daily plans lead faster to the goal!',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
