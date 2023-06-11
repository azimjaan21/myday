import 'package:flutter/material.dart';

class SuggestionWidget extends StatelessWidget {
  final Function showSuggestionModalSheet;

  const SuggestionWidget(
    this.showSuggestionModalSheet, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: const Color(0xff8988B2),
      icon: const Icon(
        Icons.lightbulb_outlined,
        size: 27,
      ),
      onPressed: () {
        showSuggestionModalSheet(context);
      },
      label: const Text(
        'Suggestion',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
