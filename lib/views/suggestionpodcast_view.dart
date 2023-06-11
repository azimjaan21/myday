import 'package:flutter/material.dart';

class PodcastView extends StatelessWidget {
  final Function showSuggestionModalSheet;

  const PodcastView(this.showSuggestionModalSheet, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Container(
                width: 150,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/3.jpg',
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'More about ',
                        ),
                        TextSpan(
                            text: 'MyDay',
                            style: TextStyle(color: Colors.orange)),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.indigo),
                    children: [
                      TextSpan(
                          text: 'Powered by ',
                          style: TextStyle(
                            color: Colors.orange,
                          )),
                      TextSpan(
                        text: 'AzimjaanTech',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
