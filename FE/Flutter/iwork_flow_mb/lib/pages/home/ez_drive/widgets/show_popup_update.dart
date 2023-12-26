import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iwork_flow_mb/cubits/ez_drive/ez_drive_cubit.dart';
import 'package:iwork_flow_mb/cubits/ez_drive/ez_drive_update_cubit.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';
import 'package:iwork_flow_mb/stores/commons/enums/space_scope.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/dialog.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/button.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/show_toast_notification.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/spacer.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/text_input/text_input_border_around.dart';
import 'package:iwork_flow_mb/stores/models/response/space_response/space_response.dart';

List<Map<EnumSpaceScope, String>> listOption = [
  {EnumSpaceScope.PUBLIC: EnumSpaceScope.PUBLIC.value},
  {EnumSpaceScope.RESTRICTED: EnumSpaceScope.RESTRICTED.value},
  {EnumSpaceScope.PERSONAL: EnumSpaceScope.PERSONAL.value}
];

void showUpdateDialog(BuildContext context, SpaceResponse spacesModel) {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameSpaceController =
      TextEditingController(text: spacesModel.title ?? '');

  TextEditingController descriptionController =
      TextEditingController(text: spacesModel.description ?? '');
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext contextUpdate) {
      return BlocProvider(
          create: (contextUpdate) =>
              EzDriveUpdateCubit(scope: spacesModel.scope!),
          child: BlocConsumer<EzDriveUpdateCubit, EzDriveUpdateState>(
            listener: (contextUpdate, state) {
              if (state is EzDriveUpdated) {
                context.read<EzDriveCubit>().getData();
              }
            },
            builder: (contextUpdate, state) {
              EnumSpaceScope? scopeUpdate;
              if (state is EzDriveChangeScope) {
                scopeUpdate = state.scope;
              }
              if (state is EzDriveUpdateInitial) {
                scopeUpdate = state.scope;
              }
              return DialogWidget(
                title: 'Cập nhật space',
                content: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextInputBorderAroundWidget(
                        label: 'Tên space',
                        isNull: false,
                        controller: nameSpaceController,
                      ),
                      const SpacerWidget(
                        height: 24.0,
                      ),
                      TextInputBorderAroundWidget(
                        label: 'Mô tả',
                        isNull: false,
                        maxLines: 4,
                        minLines: 4,
                        controller: descriptionController,
                      ),
                      const SpacerWidget(
                        height: 24.0,
                      ),
                      if (scopeUpdate != null)
                        renderSelectedScope(contextUpdate, scopeUpdate)
                    ],
                  ),
                ),
                actions: [
                  ButtonWidget(
                      onTap: () {
                        Navigator.pop(contextUpdate);
                      },
                      border: Border.all(
                          width: 1.0, color: MyColors.secondaryTextColor),
                      textStyle:
                          const TextStyle(color: MyColors.secondaryTextColor),
                      text: 'Cancel'),
                  ButtonWidget(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          SpaceResponse spacesModelUpdate = SpaceResponse(
                              id: spacesModel.id,
                              description: descriptionController.text,
                              scope: scopeUpdate,
                              title: nameSpaceController.text);

                          contextUpdate
                              .read<EzDriveUpdateCubit>()
                              .updatedSpace(spacesModelUpdate);
                          Navigator.pop(contextUpdate);
                        } else {
                          showToast(
                              msg: "Vui lòng nhập đủ các trường!",
                              color: Colors.red,
                              context: contextUpdate);
                        }
                      },
                      border: Border.all(width: 1.0, color: scheme.primary),
                      backgroundColor: scheme.primary,
                      textStyle: const TextStyle(color: Colors.white),
                      text: 'Lưu lại')
                ],
              );
            },
          ));
    },
  );
}

renderSelectedScope(BuildContext context, EnumSpaceScope scope) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Phạm vi',
        style: TextStyle(fontSize: 15, color: MyColors.secondaryTextColor),
      ),
      const SizedBox(
        height: 10,
      ),
      Wrap(
        spacing: 3,
        children: [
          for (Map<dynamic, dynamic> item in listOption)
            InkWell(
              onTap: () {
                context.read<EzDriveUpdateCubit>().changeScope(item.keys.first);
              },
              child: Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  color: (scope == item.keys.first)
                      ? scheme.primary
                      : Colors.white,
                  border: Border.all(
                      width: 0.7,
                      color: (scope == item.keys.first)
                          ? scheme.primary
                          : MyColors.secondaryTextColor),
                ),
                child: Center(
                  child: Text(
                    item.values.first,
                    style: TextStyle(
                        color: (scope == item.keys.first)
                            ? Colors.white
                            : MyColors.secondaryTextColor),
                  ),
                ),
              ),
            )
        ],
      )
    ],
  );
}
