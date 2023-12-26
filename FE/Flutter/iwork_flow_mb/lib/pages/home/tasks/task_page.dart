import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/pages/home/tasks/screens/my_task.dart';
import 'package:iwork_flow_mb/pages/home/tasks/screens/tasks_completed.dart';
import 'package:iwork_flow_mb/pages/home/tasks/screens/tasks_waiting.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/tab_menu_widget.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TabMenuWidget(
        listTab: [
          Tab(
            icon: Icon(Icons.download),
            text: "Công việc của tôi",
          ),
          Tab(
            icon: Icon(Icons.check_circle),
            text: "Đã hoàn thành",
          ),
          Tab(
            icon: Icon(Icons.group),
            text: "Đang chờ",
          ),
        ],
        listWidget: [
          MyTasksScreen(),
          TasksCompletedScreen(),
          TasksWaitingScreen()
        ],
      ),
    );
  }
}
