import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function swipeCallback;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.swipeCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: swipeCallback,
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              ' $taskTitle',
              //textAlign: TextAlign.start,
              style: TextStyle(
                  decoration: isChecked ? TextDecoration.lineThrough : null),
            ),
            Divider(
              height: 5.0,
              color: Colors.black54,
            )
          ],
        ),
        trailing: Checkbox(
            value: isChecked,
            activeColor: Colors.purple[200],
            onChanged: checkboxCallback),
      ),
    );
  }
}
