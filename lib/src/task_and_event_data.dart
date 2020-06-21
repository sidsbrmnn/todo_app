import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'events/models/events.dart';
import 'tasks/models/task.dart';

class TaskAndEventData extends ChangeNotifier{

   static void sortEvents(){
    _eventList.sort((a,b)=> a.time.compareTo(b.time));
  }

  static final List<Event> _eventList = [
    Event(
      time: '08:00',
      task: 'Coffee with Sam',
      category: 'Personal',
      isComplete: true,
    ),
    Event(
      time: '10:00',
      task: 'Meet with Sales',
      category: 'Work',
      isComplete: true,
    ),
    Event(
      time: '12:00',
      task: 'Edit API documentation about SSO',
      category: 'Work',
      isComplete: false,
    ),
    Event(
      time: '18:00',
      task: 'Go to Gym',
      category: 'Personal',
      isComplete: false,
    ),
    Event(
      time: '20:00',
      task: 'Go Home',
      category: 'Personal',
      isComplete: true,
    ),
  ];

  int get eventCount{
    return _eventList.length;
  }

  UnmodifiableListView<Event> get event{
    return UnmodifiableListView(_eventList);
  }

  void addEvent(String task, String time,String category){
    _eventList.add(Event(task: task, time: time,category: category ));
    notifyListeners();
  }
  void updateEvent(Event event){
    event.toggleDone();
    notifyListeners();
  }

  void deleteEvent(Event event){
    _eventList.remove(event);
    notifyListeners();
  }



  List<Task> _tasks = [
    Task(task: 'Call Tom about appointment', isComplete: false),
    Task(task: 'Fix on boarding experience', isComplete: false),
    Task(task: 'Edit API documentation', isComplete: false),
    Task(task: 'Set up user focus group', isComplete: false),
    Task(task: 'Have coffee with Sam', isComplete: true),
    Task(task: 'Meet with Sales', isComplete: true),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String taskName) {
    _tasks.add(Task(task: taskName));
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