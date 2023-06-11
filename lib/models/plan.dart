class PlanModel {
  final String id;
  final String name;
  final DateTime planDate;
  bool isDone = false;

  PlanModel({
    required this.id,
    required this.name,
    required this.planDate,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}

class Plans {
  final List<PlanModel> _plansList = [

  ];

  List<PlanModel> get plansList {
    return _plansList;
  }

  //
//Showing with soting  Plan byDay
  //
  List<PlanModel> sortByDay(DateTime date) {
    return _plansList
        .where((todo) =>
            todo.planDate.day == date.day &&
            todo.planDate.month == date.month &&
            todo.planDate.year == date.year)
        .toList();
  }

  void addToDo(String planName, DateTime planDate) {
    plansList.add(
      PlanModel(
        id: 'r${_plansList.length + 1}',
        name: planName,
        planDate: planDate,
      ),
    );
  }

  void removeToDo(String id){
    _plansList.removeWhere((plan) => plan.id == id);
  }
}
