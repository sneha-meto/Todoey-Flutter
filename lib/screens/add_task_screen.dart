import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_notifier.dart';

class AddTaskScreen extends StatelessWidget {
//  final Function addTaskCallback;
  static String taskName;
//  AddTaskScreen({this.addTaskCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff757575),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Add Task',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.purple[200],
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      taskName = value;
                    },
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                    autofocus: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple[200],
                        width: 2.0,
                      ),
                    )

                        // border: InputBorder(borderSide: ),
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    onPressed: () {
                      //set listen to false here bcz the button does not have to continuously listen to changes
                      //rather it just gets te updated data when pressed, thereby saving resources.
                      Provider.of<Notifier>(context, listen: false)
                          .addTask(taskName);
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.purple[200],
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(
                          horizontal: 120.0, vertical: 15.0),
                      child: Text(
                        'Add',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
