import 'package:flutter/material.dart';
import 'package:todoeyflutter/models/task.dart';
import 'package:todoeyflutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_notifier.dart';

class TaskList extends StatelessWidget {
  //TaskList({this.tasks});

  @override
  Widget build(BuildContext context) {
    //final List tasks = Provider.of<Notifier>(context).tasks;
    return Consumer<Notifier>(
      builder: (context, notifier, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            //final task = notifier.tasks[index];
            return TaskTile(
              taskTitle: notifier.tasks[index].name,
              isChecked: notifier.tasks[index].isDone,
              checkboxCallback: (checkboxState) {
                notifier.updateTask(notifier.tasks[index]);
              },
              swipeCallback: (DragEndDetails details) {
                notifier.deleteTask(notifier.tasks[index]);
              },
            );
          },
          itemCount: notifier.taskCount,
        );
      },
    );
  }
}
