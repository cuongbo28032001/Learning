import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onTap;
  final double? width;
  final double? heiget;
  final Color? backgroundColor;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final String text;
  final TextStyle? textStyle;
  const ButtonWidget(
      {super.key,
      required this.onTap,
      this.width,
      this.heiget,
      this.backgroundColor,
      this.border,
      this.borderRadius,
      required this.text,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        width: width ?? 80,
        height: heiget,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: border,
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(5.0))),
        child: Center(
            child: Text(
          text,
          style: textStyle ??
              TextStyle(
                color: scheme.primary,
                fontSize: 16,
              ),
        )),
      ),
    );
  }
}
