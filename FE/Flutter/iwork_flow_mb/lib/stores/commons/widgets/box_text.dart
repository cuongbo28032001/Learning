import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';

class BoxTextWidget extends StatelessWidget {
  final String text;
  final bool subString;
  final int? startIndex;
  final int? endIndex;
  final Color? backroundColor;
  final double? withBox;
  final double? heightBox;
  final double? fontSize;
  final Color? colorText;
  final DecorationImage? backgroundImage;
  const BoxTextWidget(
      {super.key,
      required this.text,
      required this.subString,
      this.startIndex,
      this.endIndex,
      this.backroundColor,
      this.withBox,
      this.heightBox,
      this.fontSize,
      this.colorText,
      this.backgroundImage})
      : assert(subString == false
            ? (startIndex == null && endIndex == null)
            : (startIndex != null &&
                endIndex != null &&
                startIndex < endIndex)),
        assert((backgroundImage == null && backroundColor != null) ||
            (backgroundImage != null && backroundColor == null));

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
        image: backgroundImage,
        color: backroundColor,
      ),
      child: SizedBox(
        height: heightBox ?? 35,
        width: withBox ?? 35,
        child: Center(
          child: Text(
            subString ? text.substring(startIndex!, endIndex!) : text,
            style: TextStyle(
                color: colorText ?? MyColors.buttonActive.withOpacity(0.8),
                fontSize: fontSize,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
