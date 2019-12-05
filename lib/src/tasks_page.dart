import 'package:flutter/material.dart';

import 'models.dart';

final List<Task> _taskList = [
  Task(task: 'Call Tom about appointment', isComplete: false),
  Task(task: 'Fix on boarding experience', isComplete: false),
  Task(task: 'Edit API documentation', isComplete: false),
  Task(task: 'Set up user focus group', isComplete: false),
  Task(task: 'Have coffee with Sam', isComplete: true),
  Task(task: 'Meet with Sales', isComplete: true)
];

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      itemCount: _taskList.length,
      itemBuilder: (BuildContext context, int index) {
        return _taskList[index].isComplete
            ? _taskComplete(_taskList[index].task)
            : _taskIncomplete(_taskList[index].task);
      },
    );
  }

  Widget _taskComplete(String text) {
    return Container(
      foregroundDecoration: BoxDecoration(color: Color(0x60FDFDFD)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.radio_button_checked,
              color: Theme.of(context).accentColor,
              size: 24.0,
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _taskIncomplete(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.radio_button_unchecked,
            color: Theme.of(context).accentColor,
            size: 24.0,
          ),
          SizedBox(
            width: 16.0,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
