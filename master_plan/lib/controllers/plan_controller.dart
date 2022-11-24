import '../models/data_layer.dart';
import '../services/plan_services.dart';

class PlanController {
  final _plans = <Plan>[];
  final services = PlanServices();

  // This public getter cannot be modified by any other object
  List<Plan> get plans => List.unmodifiable(_plans);

  void addNewPlan(String name) {
    if (name.isEmpty) {
      return;
    }
    // name = _checkForDuplicates(_plans.map((plan) => plan.name), name);
    // final plan = Plan()..name = name;
    // _plans.add(plan);

    name = _checkForDuplicates(plans.map((plan) => plan.name), name);
    services.createPlan(name);
  }

  // void deletePlan(Plan plan) {
  //   _plans.remove(plan);
  // }

  void savePlan(Plan plan) {
    services.savePlan(plan);
  }

  void deletePlan(Plan plan) {
    services.delete(plan);
  }

  // void createNewTask(Plan plan, [String? description]) {
  //   if (description == null || description.isEmpty) {
  //     description = 'New Task';
  //   }
  //   description = _checkForDuplicates(
  //       plan.tasks.map((task) => task.description), description);
  //   final task = Task()..description = description;
  //   plan.tasks.add(task);
  // }

  // void deleteTask(Plan plan, Task task) {
  //   plan.tasks.remove(task);
  // }

  void createNewTask(Plan plan, [String? description]) {
    if (description == null || description.isEmpty) {
      description = 'New Task';
    }
    description = _checkForDuplicates(
        plan.tasks.map((task) => task.description), description);
    services.addTask(plan, description);
  }

  void deleteTask(Plan plan, Task task) {
    services.deleteTask(plan, task);
  }

  String _checkForDuplicates(Iterable<String> items, String text) {
    final duplicatedCount = items.where((item) => item.contains(text)).length;
    if (duplicatedCount > 0) {
      text += ' ${duplicatedCount + 1}';
    }
    return text;
  }
}
