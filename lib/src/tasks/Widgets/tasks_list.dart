import 'package:flutter/material.dart';
import '../Widgets/task_tile.dart';
import 'package:provider/provider.dart';
import '../models/tasks_data.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Consumer<TasksData>(
        builder: (context, taskData, child){
          return ListView.builder(
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return TaskTile(
                taskTitle: task.task,
                isChecked: task.isComplete,
                checkboxCallback: () {
                  taskData.updateTask(task);
                },
                longPressCallback: (){
                  taskData.deleteTask(task);

                },
              );
            },
            itemCount: taskData.taskCount,
          );
        },
      ),
    );
  }
}
