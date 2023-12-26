// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/string.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_image_local.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/no_data.dart';

class DashBoardPage extends StatefulWidget {
  final String title;
  const DashBoardPage({super.key, required this.title});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  void initState() {
    super.initState();
    print("-------------dashboard");
  }

  @override
  Widget build(BuildContext context) {
    return const NoDataWidget(
      imageAsset: girlTickedImage,
      message: noTaskToday,
    );
  }
}
