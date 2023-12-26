import 'package:flutter/material.dart';

class SingleTaskConfigPage extends StatelessWidget {
  const SingleTaskConfigPage({super.key, required this.title});

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
