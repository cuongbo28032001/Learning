// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/pages/calender/calender_page.dart';
import 'package:iwork_flow_mb/pages/home/home_page.dart';
import 'package:iwork_flow_mb/pages/message/message_page.dart';
import 'package:iwork_flow_mb/pages/notification/notification_page.dart';
import 'package:iwork_flow_mb/pages/profile/profile_page.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/bottom_Navigation.dart';

var indexBottomBarClicked = 0;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  updateBottomBarState(int index) {
    setState(() {
      indexBottomBarClicked = index;
      indexDrawerClicked = 0;
    });
  }

  Widget bodyAPP(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const CalenderPage();
      case 2:
        return const MessagePage();
      case 3:
        return const NotificationPage();
      case 4:
        return const ProfilePage();
      default:
        return const Scaffold(
          body: Center(
            child: Text("Page is not find"),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyAPP(indexBottomBarClicked),
      bottomNavigationBar: BottomNavigationBarWidget(
        onClicked: (index) {
          updateBottomBarState(index);
        },
      ),
    );
  }
}
