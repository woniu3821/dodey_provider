import 'package:flutter/material.dart';
import 'package:tododey/models/task_data.dart';
import 'package:provider/provider.dart';

import 'tasks_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskData = context.read<TaskData>();

    return ListView.builder(
      itemBuilder: (context, index) {
        var taskItem = taskData.tasks[index];
        return TasksTile(
          taskTitle: taskItem.name,
          isChecked: taskItem.isDone,
          checkboxCallback: (checkboxState) {
            taskData.updateTask(taskItem);
          },
          onLongPress: () {
            taskData.deleteTask(taskItem);
          },
        );
      },
      itemCount: taskData.tasksCount,
    );
  }
}
