import 'package:flutter/material.dart';

class CardLayoutWidget extends StatelessWidget {
  final Widget child;
  final Color? backgroungColor;
  final Color? boderColor;
  final DecorationImage? imageAsset;
  final double? width;
  const CardLayoutWidget({
    super.key,
    this.backgroungColor,
    this.boderColor,
    this.imageAsset,
    this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroungColor ?? Colors.white,
        image: imageAsset,
        border: boderColor != null
            ? Border.all(color: boderColor!, width: 1.0)
            : null,
        boxShadow: boderColor == null
            ? const [
                BoxShadow(
                  color: Color.fromRGBO(139, 146, 165, 0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
