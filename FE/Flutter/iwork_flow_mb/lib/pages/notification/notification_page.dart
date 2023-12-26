import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/styles.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_image_local.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              happyGirlImage,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                "Không có thông báo mới nào!",
                style: StyleText().styleTextDecreption,
              ),
            )
          ],
        ),
      ),
    );
  }
}
