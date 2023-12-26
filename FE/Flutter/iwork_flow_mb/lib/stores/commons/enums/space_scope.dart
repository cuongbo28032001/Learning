// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_icon_local.dart';
import 'package:iwork_flow_mb/stores/models/widget_models/scope_model.dart';

enum EnumSpaceScope {
  PUBLIC('Công khai'),
  RESTRICTED('Giới hạn'),
  PERSONAL('Cá nhân');

  const EnumSpaceScope(this.value);
  final String value;

  static setScopeModelByName(EnumSpaceScope input) {
    switch (input) {
      case EnumSpaceScope.PUBLIC:
        return ScopeSpaceModelWidget(
            scope: EnumSpaceScope.PUBLIC.value,
            icon: worldIconSVG,
            color: MyColors.buttonActive);
      case EnumSpaceScope.RESTRICTED:
        return ScopeSpaceModelWidget(
            scope: EnumSpaceScope.RESTRICTED.value,
            icon: usersIconSVG,
            color: const Color.fromARGB(255, 255, 199, 0));
      case EnumSpaceScope.PERSONAL:
        return ScopeSpaceModelWidget(
            scope: EnumSpaceScope.RESTRICTED.value,
            icon: userIconSVG,
            color: const Color.fromARGB(255, 114, 57, 234));
      default:
        return '';
    }
  }
}
