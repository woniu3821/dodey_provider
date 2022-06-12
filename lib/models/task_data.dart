import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import './task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  int get tasksCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTile) {
    _tasks.add(Task(name: newTaskTile));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
