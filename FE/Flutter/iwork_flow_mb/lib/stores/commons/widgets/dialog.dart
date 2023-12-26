import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/button.dart';

class DialogWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget>? actions;
  const DialogWidget(
      {super.key, required this.title, required this.content, this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      titlePadding: const EdgeInsets.only(top: 12.0, bottom: 8.0, left: 16.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
              splashRadius: 15,
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                size: 20,
                color: MyColors.secondaryIconColor,
              ))
        ],
      ),
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              thickness: 1.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: content,
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Divider(
              thickness: 1.0,
            ),
          ],
        ),
      ),
      actionsPadding: const EdgeInsets.only(
          right: 16.0, left: 16.0, bottom: 12.0, top: 4.0),
      actions: actions ??
          [
            ButtonWidget(
                onTap: () {
                  Navigator.pop(context);
                },
                backgroundColor: scheme.primary.withOpacity(0.1),
                text: 'Close'),
          ],
    );
  }
}
