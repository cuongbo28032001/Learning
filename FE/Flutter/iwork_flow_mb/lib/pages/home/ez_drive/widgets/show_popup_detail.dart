import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';
import 'package:iwork_flow_mb/stores/commons/enums/space_scope.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/dialog.dart';
import 'package:iwork_flow_mb/stores/models/response/space_response/space_response.dart';
import 'package:iwork_flow_mb/stores/models/widget_models/scope_model.dart';

void showDetailsDialog(BuildContext context, SpaceResponse spaceResponse) {
  ScopeSpaceModelWidget scopeModelWidget =
      EnumSpaceScope.setScopeModelByName(spaceResponse.scope!);
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext contextDialog) {
      return DialogWidget(
        title: spaceResponse.title ?? '',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Thông tin chung",
              style: TextStyle(
                  color: MyColors.secondaryIconColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
            _renderLineInfo('Tên', spaceResponse.title ?? ''),
            _renderLineInfo('Mô tả', spaceResponse.description ?? ''),
            _renderLineInfo('Phạm vi', scopeModelWidget.scope ?? ''),
            _renderLineInfo('Ngày tạo', spaceResponse.createdDate ?? ''),
            _renderLineInfo('Người tạo', spaceResponse.createdBy?.name ?? ''),
          ],
        ),
      );
    },
  );
}

_renderLineInfo(String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          title,
          style:
              const TextStyle(color: MyColors.secondaryTextColor, fontSize: 13),
        )),
        Expanded(
            child: Text(
          value,
          style: const TextStyle(fontSize: 13),
        ))
      ],
    ),
  );
}
