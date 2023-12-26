// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

Widget listEventsWidget({BuildContext? context, dynamic selectedEvents}) {
  return Expanded(
    child: ValueListenableBuilder<List>(
      valueListenable: selectedEvents,
      builder: (context, value, _) {
        return ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                onTap: () => print('${value[index]}'),
                title: Text('${value[index]}'),
              ),
            );
          },
        );
      },
    ),
  );
}
