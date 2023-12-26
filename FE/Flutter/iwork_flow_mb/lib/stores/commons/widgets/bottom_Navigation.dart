// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final Function onClicked;
  const BottomNavigationBarWidget({super.key, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      items: const [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.calendar_month, title: 'Calender'),
        TabItem(icon: Icons.message, title: 'Message'),
        TabItem(icon: Icons.notifications, title: 'Notification'),
        TabItem(icon: Icons.people, title: 'Profile'),
      ],
      onTap: (int i) => onClicked(i),
    );
  }
}
