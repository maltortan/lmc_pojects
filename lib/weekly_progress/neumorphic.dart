import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Task {
  final String title;
  final double progress;
  final Color color;

  Task({required this.title, required this.progress, required this.color});
}

class TaskListScreen extends StatelessWidget {
  final List<Task> tasks = [
    Task(
      title: "Task 1",
      progress: 0.7,
      color: Colors.blue,
    ),
    Task(
      title: "Task 2",
      progress: 0.4,
      color: Colors.green,
    ),
    Task(
      title: "Task 3",
      progress: 0.2,
      color: Colors.orange,
    ),
    Task(
      title: "Task 4",
      progress: 0.9,
      color: Colors.purple,
    ),
    Task(
      title: "Task 5",
      progress: 0.6,
      color: Colors.red,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Task List"),
      ),
      body: Container(
        height: height*.9,
        width: width,
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Container(
              height: height*.15,
              width: width*.5,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    depth: 8,
                    color: Colors.grey[300],
                    border: NeumorphicBorder(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Container(
                    height: 100,
                    width: width*.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width*.25,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              tasks[index].title,
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        Container(
                          width: width*.25,
                          child: Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0.0, end: tasks[index].progress),
                              duration: Duration(seconds: 3),
                              builder: (context, value, child) {
                                return NeumorphicProgress(
                                  percent: value,
                                  style: ProgressStyle(
                                    borderRadius: BorderRadius.circular(8),
                                    depth: 4,
                                    accent: tasks[index].color,
                                  ),
                                );
                              },
                            ),
                          ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
