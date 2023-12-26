import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/pages/home/single-tasks/screens/single_tasks_completed.dart';
import 'package:iwork_flow_mb/pages/home/single-tasks/screens/single_tasks_sent.dart';
import 'package:iwork_flow_mb/pages/home/single-tasks/screens/single_tasks_wait_for_execution.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/tab_menu_widget.dart';

class SingleTaskPage extends StatelessWidget {
  const SingleTaskPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TabMenuWidget(
        listTab: [
          Tab(
            icon: Icon(Icons.download),
            text: "Chờ thực hiện",
          ),
          Tab(
            icon: Icon(Icons.check_circle),
            text: "Đã hoàn thành",
          ),
          Tab(
            icon: Icon(Icons.send_outlined),
            text: "Đã gửi",
          ),
        ],
        listWidget: [
          SingleTasksWaitForExecutionScreen(),
          SingleTasksCompletedScreen(),
          SingleTasksSentScreen()
        ],
      ),
    );
  }
}
