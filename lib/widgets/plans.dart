import 'package:flutter/material.dart';
import 'package:myday/models/plan.dart';

class PlansWidget extends StatelessWidget {
  final PlanModel plan;
  final Function showDone;
  final Function removePlan;
  const PlansWidget(
    this.plan,
    this.showDone,
    this.removePlan, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          showDone(plan.id);
        },
        icon: plan.isDone
            ? const Icon(
                Icons.check_circle_outlined,
                size: 30,
                color: Color.fromARGB(255, 13, 216, 23),
              )
            : const Icon(
                Icons.circle_outlined,
                size: 30,
              ),
      ),
      title: Text(
        plan.name,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
          decoration:
              plan.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          color: plan.isDone
              ? const Color.fromARGB(255, 86, 86, 86)
              : Colors.white,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          removePlan(plan.id);
        },
        icon: const Icon(
          Icons.highlight_remove_outlined,
          size: 30,
          color: Colors.red,
        ),
      ),
    );
  }
}
