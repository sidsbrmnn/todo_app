import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TasksData extends ChangeNotifier{
  List<Task> _tasks = [Task(task: 'Call Tom about appointment', isComplete: false),
    Task(task: 'Fix on boarding experience', isComplete: false),
    Task(task: 'Edit API documentation', isComplete: false),
    Task(task: 'Set up user focus group', isComplete: false),
    Task(task: 'Have coffee with Sam', isComplete: true),
    Task(task: 'Meet with Sales', isComplete: true)];
  int get taskCount{
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
}

  void addTask(String taskName){
    _tasks.add(Task(task: taskName));
    notifyListeners();
  }
  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}