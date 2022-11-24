import 'package:flutter/material.dart';
import './models/data_layer.dart';
import './controllers/plan_controller.dart';

class PlanProvider extends InheritedWidget {
  final _controller = PlanController();
  // final _plan = Plan();
  final _plans = <Plan>[];
  PlanProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  // static Plan of(BuildContext context) {
  //   final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
  //   return provider!._plan;
  // }

  // static List<Plan> of(BuildContext context) {
  //   final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
  //   return provider!._plans;
  // }

  static PlanController of(BuildContext context) {
    PlanProvider? provider =
        context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider!._controller;
  }
}
