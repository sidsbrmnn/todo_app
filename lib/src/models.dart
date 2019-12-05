import 'package:flutter/material.dart';

enum PageType { Tasks, Events }

class Page {
  final String name;
  final PageType pageType;
  final Widget component;
  final Widget newItemPage;

  Page({this.name, this.pageType, this.component, this.newItemPage});
}

class Event {
  final String time;
  final String task;
  final String category;
  final bool isComplete;

  Event({this.category, this.time, this.task, this.isComplete});
}

class Task {
  final String task;
  final bool isComplete;

  Task({this.task, this.isComplete});
}
