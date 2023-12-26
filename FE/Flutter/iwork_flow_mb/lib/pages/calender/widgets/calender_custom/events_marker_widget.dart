import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';

Widget buildEventsMarker({DateTime? date, List? events}) {
  return Positioned(
    bottom: 6,
    right: 6,
    child: Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: scheme.error),
      width: 14.0,
      height: 14.0,
      child: Center(
        child: Text(
          '${events?.length}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10.0,
          ),
        ),
      ),
    ),
  );
}
