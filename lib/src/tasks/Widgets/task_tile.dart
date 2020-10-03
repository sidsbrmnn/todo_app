import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.longPressCallback,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  checkboxCallback,
      onLongPress: longPressCallback,
      child: Container(
        foregroundDecoration:
            isChecked ? BoxDecoration(color: Color(0x60FDFDFD)) : null,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                isChecked ?  Icons.radio_button_checked : Icons.radio_button_unchecked,
                color: Theme.of(context).accentColor,
                size: 24.0,
              ),
              SizedBox(
                width: 16.0,
              ),
              Text(
                taskTitle,
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
        ),
      ),
    );


  }
}
