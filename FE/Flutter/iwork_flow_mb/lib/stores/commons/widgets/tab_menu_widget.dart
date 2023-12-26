import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';

class TabMenuWidget extends StatelessWidget {
  final List<Widget> listWidget;
  final List<Tab> listTab;
  const TabMenuWidget(
      {super.key, required this.listTab, required this.listWidget});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: listWidget.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ButtonsTabBar(
            backgroundColor: MyColors.buttonActive,
            unselectedBackgroundColor: Colors.grey[300],
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            labelStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            tabs: [for (Tab tab in listTab) tab],
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                for (Widget widget in listWidget) widget,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
