import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/pages/home/ez_drive/widgets/show_popup_detail.dart';
import 'package:iwork_flow_mb/pages/home/ez_drive/widgets/show_popup_update.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';
import 'package:iwork_flow_mb/stores/models/response/space_response/space_response.dart';

void showPopupMenu(
    BuildContext context, Offset offset, SpaceResponse spaceResponse) async {
  await showMenu(
    context: context,
    position: RelativeRect.fromLTRB(
        offset.dx + 100, offset.dy + 165, offset.dx, offset.dy),
    color: MyColors.buttonHintColor,
    items: [
      PopupMenuItem(
        child: ListTile(
          leading: const Icon(Icons.info),
          title: const Text('Chi tiết'),
          onTap: () {
            Navigator.pop(context);
            showDetailsDialog(context, spaceResponse);
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Cập nhật'),
          onTap: () {
            Navigator.pop(context);
            showUpdateDialog(context, spaceResponse);
          },
        ),
      ),
    ],
  );
}
