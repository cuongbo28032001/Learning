import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';

Widget selectedBuilderWidget(
    {AnimationController? animationController, DateTime? date, bool? isToday}) {
  return FadeTransition(
    opacity: Tween(begin: 0.0, end: 1.0).animate(animationController!),
    child: Center(
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: !isToday!
                ? MyColors.buttonActive
                : MyColors.buttonActive.withOpacity(0.3),
            borderRadius: const BorderRadius.all(Radius.circular(100))),
        child: Center(
          child: Text(
            '${date!.day}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
