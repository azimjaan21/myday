import 'package:flutter/material.dart';
import 'package:myday/models/plan.dart';
import 'package:myday/views/modal_bottomsheet_view.dart';
import 'package:myday/views/suggestionpodcast_view.dart';

import '../widgets/add_plan.dart';
import '../widgets/plan_counter.dart';
import '../widgets/suggestion.dart';
import '../widgets/time.dart';
import 'package:myday/widgets/plan_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //import plans model
  final Plans _plans = Plans();
  DateTime _markedDate = DateTime.now();
//to pick data from Calendar
  void _pickCalendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    ).then((selectedDate) {
      if (selectedDate != null) {
        setState(() {
          _markedDate = selectedDate;
        });
      }
    });
  }

  //to scroll date PAST and FUTURE
  void _scrollPastDate() {
    setState(() {
      _markedDate =
          DateTime(_markedDate.year, _markedDate.month, _markedDate.day - 1);
    });
  }

  void _scrollFutureDate() {
    setState(() {
      _markedDate =
          DateTime(_markedDate.year, _markedDate.month, _markedDate.day + 1);
    });
  }

  // show plan is done when it presses
  void _showDone(String planId) {
    setState(() {
      _plans
          .sortByDay(_markedDate)
          .firstWhere((plan) => plan.id == planId)
          .toggleDone();
    });
  }

// To REMOVE plans
  // ignore: unused_element
  void _removePlan(String planId) {
    setState(() {
      _plans.removeToDo(planId);
    });
  }

  // For Count Plan numbers and how many complited
  int get _allPlanNumbers {
    return _plans.sortByDay(_markedDate).length;
  }

  int get _finishedPlanNumbers {
    return _plans.sortByDay(_markedDate).where((plan) => plan.isDone).length;
  }

// show ModalBottomSheet Function
  void _showModalScreen(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      // ignore: prefer_const_constructors
      builder: (ctx) => ModalBottomSheetView(_addPlan),
    );
  }

  // ADDING INFO(DATE+PLANNAME)
  void _addPlan(String planName, DateTime planDate) {
    setState(() {
      _plans.addToDo(planName, planDate);
    });
    Navigator.of(context).pop();
  }

  void _showSuggestionModalSheet(BuildContext context) {
    showModalBottomSheet(
      
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => PodcastView(_showSuggestionModalSheet),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/background.png',
              ),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'My Day',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TimeWidget(_pickCalendar, _markedDate, _scrollPastDate,
                    _scrollFutureDate),
                const SizedBox(
                  height: 20,
                ),
                PlanCounterWidget(
                  allPlanNumbers: _allPlanNumbers,
                  finishedPlanNumber: _finishedPlanNumbers,
                ),
                const SizedBox(
                  height: 35,
                ),
                // ignore: prefer_const_constructors
                PlanListWidget(
                    _plans.sortByDay(_markedDate), _showDone, _removePlan),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SuggestionWidget(_showSuggestionModalSheet),
                      PlanAddWidget(_showModalScreen),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
