import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/drawer_Navigation.dart';
import 'package:iwork_flow_mb/stores/models/widget_models/drawer_model.dart';

var indexDrawerClicked = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Function updateState(int index) {
    return () {
      setState(() {
        indexDrawerClicked = index;
      });
      Navigator.pop(context);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listDrawerItemWidget[indexDrawerClicked].title),
      ),
      drawer: DrawerNavigationWidget(
        onClicked: updateState,
      ),
      body: listDrawerItemWidget[indexDrawerClicked].object as Widget,
    );
  }
}
