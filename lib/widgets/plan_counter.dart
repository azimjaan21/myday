import 'package:flutter/material.dart';

class PlanCounterWidget extends StatelessWidget {
  final int allPlanNumbers;
  final int finishedPlanNumber;

  const PlanCounterWidget({
    super.key,
    required this.allPlanNumbers,
    required this.finishedPlanNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 100,
          width: 160,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                allPlanNumbers.toString(),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
           const   Text(
                'All my plans',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w100,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          width: 160,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                finishedPlanNumber.toString(),
                style:const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 13, 216, 23),
                ),
              ),
             const SizedBox(
                height: 5,
              ),
             const Text(
                'Complited',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w100,
                  color: Color.fromARGB(255, 13, 216, 23),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
