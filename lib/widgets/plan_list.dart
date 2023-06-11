import 'package:flutter/material.dart';
import 'package:myday/models/plan.dart';
import 'package:myday/widgets/plans.dart';

class PlanListWidget extends StatelessWidget {
  final List<PlanModel> plans;
  final Function showDone;
  final Function removePlan;

  const PlanListWidget(this.plans, this.showDone, this.removePlan, {super.key});

  @override
  Widget build(BuildContext context) {
    return plans.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 3.3,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withAlpha(170)),
                child: PlansWidget(
                  plans[index],
                  showDone,
                  removePlan,
                ),
              ),
              itemCount: plans.length,
            ),
          )
        : Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('There are no plans',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),),
                 const SizedBox(
                    height: 15,
                  ),
                  Image.asset(
                    'assets/images/noplan.png',
                    fit: BoxFit.cover,
                    width: 110,
                  ),
                ],
              ),
            ),
          );
  }
}
