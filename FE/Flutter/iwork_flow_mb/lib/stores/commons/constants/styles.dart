import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';

class StyleText {
  double? fontSize;
  FontStyle? fontStyle;
  StyleText({this.fontSize, this.fontStyle});

  TextStyle get styleTextDecreption => TextStyle(
      color: MyColors.secondaryTextColor,
      fontSize: fontSize ?? 14.0,
      fontStyle: fontStyle,
      wordSpacing: 1.5);

  TextStyle get styleTextLabel => TextStyle(
      color: MyColors.titleTextColor,
      fontSize: fontSize ?? 14.0,
      fontStyle: fontStyle);
}
