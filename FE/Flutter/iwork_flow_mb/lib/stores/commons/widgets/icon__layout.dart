import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconLayoutWidget extends StatelessWidget {
  final Color? backgroungColor;
  final double? borderRadius;
  final double? padding;
  final Widget child;

  const IconLayoutWidget(
      {super.key,
      this.backgroungColor,
      this.padding,
      this.borderRadius,
      required this.child})
      : assert(child is Icon || child is SvgPicture);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroungColor ?? Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? 10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding ?? 12.0),
        child: child,
      ),
    );
  }
}
