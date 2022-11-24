import 'package:flutter/foundation.dart';
import 'package:master_plan/models/task.dart';
import '../repositories/repository.dart';

class Plan {
  final int? id;
  List<Task> tasks = [];
  var name;

  Plan({@required this.id, this.name = ''});

  int get completeCount => tasks.where((task) => task.complete).length;

  String get completenessMessage =>
      '$completeCount out of ${tasks.length} tasks';

  Plan.fromModel(Model model)
      : id = model.id,
        name = model?.data['name'],
        tasks = model?.data['task']
                ?.map<Task>((task) => Task.fromModel(task))
                ?.toList() ??
            <Task>[];
  Model toModel() => Model(id: id!, data: {
        'name': name,
        'tasks': tasks.map((task) => task.toModel()).toList()
      });
}
