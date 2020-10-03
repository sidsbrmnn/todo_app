import 'package:flutter/material.dart';
import 'package:todo_app/src/tasks/models/task_data.dart';
import '../../widgets/custom_button.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_textfield.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Add new task',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(
            height: 24.0,
          ),
          CustomTextField(
            labelText: 'Add new',
            textCapitalization: TextCapitalization.sentences,
            cursorColor: Theme.of(context).primaryColor,
            autofocus: true,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
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
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                  Navigator.pop(context);
                },
                text: 'Add',
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
