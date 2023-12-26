// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iwork_flow_mb/pages/home/ez_drive/widgets/show_popup_menu_widget.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_icon_local.dart';
import 'package:iwork_flow_mb/stores/commons/enums/space_scope.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/box_text.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/card_layout.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/icon__layout.dart';
import 'package:iwork_flow_mb/stores/models/response/space_response/space_response.dart';
import 'package:iwork_flow_mb/stores/models/widget_models/scope_model.dart';

class CardSpaceWidget extends StatefulWidget {
  final SpaceResponse spaceResponse;
  final dynamic id;
  const CardSpaceWidget(
      {super.key, required this.id, required this.spaceResponse});

  @override
  State<CardSpaceWidget> createState() => _CardSpaceWidgetState();
}

class _CardSpaceWidgetState extends State<CardSpaceWidget> {
  @override
  Widget build(BuildContext context) {
    ScopeSpaceModelWidget scopModel =
        EnumSpaceScope.setScopeModelByName(widget.spaceResponse.scope!);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          print("Drive");
        },
        child: CardLayoutWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoxTextWidget(
                    text: widget.spaceResponse.title ?? '',
                    subString: true,
                    backroundColor: MyColors.buttonActive.withOpacity(0.1),
                    startIndex: 0,
                    endIndex: 1,
                  ),
                  Text(
                    scopModel.scope ?? '',
                    style: TextStyle(
                        color: MyColors.secondaryTextColor.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2),
                  )
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                widget.spaceResponse.title ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                widget.spaceResponse.description ?? '',
                style: const TextStyle(color: MyColors.secondaryTextColor),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconLayoutWidget(
                    padding: 8.0,
                    backgroungColor: scopModel.color!.withOpacity(0.1),
                    borderRadius: 20,
                    child: SvgPicture.asset(
                      scopModel.icon,
                      width: 12,
                      colorFilter: ColorFilter.mode(
                          scopModel.color!.withOpacity(0.8), BlendMode.srcIn),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      RenderBox renderBox =
                          context.findRenderObject() as RenderBox;
                      var offset = renderBox.localToGlobal(Offset.zero);
                      showPopupMenu(context, offset, widget.spaceResponse);
                    },
                    child: Column(
                      children: [
                        IconLayoutWidget(
                          padding: 10.0,
                          backgroungColor: MyColors.buttonHintColor,
                          child: SvgPicture.asset(
                            appOutLineIconSVG,
                            width: 15,
                            colorFilter: const ColorFilter.mode(
                                MyColors.secondaryIconColor, BlendMode.srcIn),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
