// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const List<Color> DARK_COLORS = [
  Color(0xff145c8b),
  Color(0xff005fbb),
  Color(0xffc74983),
  Color(0xff00a7ff),
  Color(0xffecca57),
  Color(0xffd96800),
  Color(0xfff282bf),
  Color(0xfff76b8b),
  Color(0xff126269)
];

Color randomColor(String input, {String type = 'dark'}) {
  int firstCharCode =
      input.isNotEmpty ? input.split(' ').last.codeUnitAt(0) : 0;
  int len = DARK_COLORS.length;

  // Use a different set of colors if type is 'dark'
  List<Color> colors = type == 'dark'
      ? DARK_COLORS
      : /* add other colors for different types */ [];

  // Use modulo to get a color index
  int colorIndex = firstCharCode % len;

  // Return the corresponding color
  return colors.isNotEmpty ? colors[colorIndex] : DARK_COLORS[colorIndex];
}
