import 'package:flutter/material.dart';

enum PageType { Tasks, Events }

class Page {
  final String name;
  final PageType pageType;
  final Widget component;
  final Widget newItemPage;

  const Page({this.name, this.pageType, this.component, this.newItemPage});
}
