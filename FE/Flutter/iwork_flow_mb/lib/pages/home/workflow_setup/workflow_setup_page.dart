import 'package:flutter/material.dart';

class WorkFlowSetupPage extends StatelessWidget {
  const WorkFlowSetupPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}
