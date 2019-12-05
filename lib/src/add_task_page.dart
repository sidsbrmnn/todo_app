import 'package:flutter/material.dart';

import 'widgets/custom_button.dart';
import 'widgets/custom_textfield.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Text(
              'Add new task',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          CustomTextField(
            labelText: 'Add new',
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: 'Cancel',
              ),
              CustomButton(
                onPressed: () {},
                text: 'Add',
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
