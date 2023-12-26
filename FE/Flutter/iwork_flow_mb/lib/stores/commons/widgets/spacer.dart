import 'package:flutter/material.dart';

class SpacerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  const SpacerWidget({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 12.0,
    );
  }
}
