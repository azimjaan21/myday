import 'package:flutter/material.dart';

class PlanAddWidget extends StatelessWidget {
  final Function showModalScreen;
  const PlanAddWidget(
    this.showModalScreen, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.amber,
      onPressed: () {
        showModalScreen(context);
      },
      child: const Icon(
        Icons.add,
        size: 35,
      ),
    );
  }
}
