import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey_app/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTile: task.name,
//              taskTile: Provider.of<TaskData>(context).tasks[index].name,
              isChecked: task.isDone,
              checkBox: (bool checkboxState) {
                taskData.updateTask(task);
              },
              longPress: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

//(
//children: [
//TaskTile(
//taskTile: tasks[0].name,
//isChecked: tasks[0].isDone,
//),
//TaskTile(
//taskTile: tasks[1].name,
//isChecked: tasks[1].isDone,
//),
//TaskTile(
//taskTile: tasks[2].name,
//isChecked: tasks[2].isDone,
//),
//],
//);
