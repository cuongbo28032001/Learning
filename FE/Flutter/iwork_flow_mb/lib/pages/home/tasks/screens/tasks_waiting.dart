import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/string.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_image_local.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/no_data.dart';

class TasksWaitingScreen extends StatelessWidget {
  const TasksWaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NoDataWidget(
      imageAsset: emptyImage,
      message: noData,
    );
  }
}