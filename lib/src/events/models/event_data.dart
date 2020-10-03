import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'events.dart';

class EventData extends ChangeNotifier {
  static void sortEvents() {
    _eventList.sort((a, b) => a.time.compareTo(b.time));
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

  int get eventCount {
    return _eventList.length;
  }

  UnmodifiableListView<Event> get event {
    return UnmodifiableListView(_eventList);
  }

  void addEvent(String task, String time, String category) {
    _eventList.add(Event(task: task, time: time, category: category));
    notifyListeners();
  }

  void updateEvent(Event event) {
    event.toggleDone();
    notifyListeners();
  }

  void deleteEvent(Event event) {
    _eventList.remove(event);
    notifyListeners();
  }
}
