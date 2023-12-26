// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';
import 'package:iwork_flow_mb/stores/commons/constants/string.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_icon_local.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_image_local.dart';
import 'package:iwork_flow_mb/stores/commons/functions/random_color.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/box_text.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/card_layout.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/icon__layout.dart';
import 'package:iwork_flow_mb/stores/models/response/user_response/user_response.dart';
import 'package:iwork_flow_mb/stores/models/response/work_flow_definition_response/work_flow_definition_response.dart';

class CardWorkFlowWidget extends StatefulWidget {
  final WorkFlowDefinitionResponse workFlowDefinitionResponse;
  const CardWorkFlowWidget({
    super.key,
    required this.workFlowDefinitionResponse,
  });

  @override
  State<CardWorkFlowWidget> createState() => _CardWorkFlowWidgetState();
}

class _CardWorkFlowWidgetState extends State<CardWorkFlowWidget> {
  double position = 5.0;
  @override
  Widget build(BuildContext context) {
    double heightImageBackground = MediaQuery.of(context).size.width / 4;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          print("workflows");
        },
        child: CardLayoutWidget(
          imageAsset: DecorationImage(
              alignment: Alignment.topRight,
              image: Image.asset(
                nestedCirclesImage,
                cacheHeight: heightImageBackground.toInt(),
                cacheWidth: heightImageBackground ~/ 10 * 9,
              ).image),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoxTextWidget(
                text: widget.workFlowDefinitionResponse.title ?? '',
                colorText: Colors.white,
                subString: true,
                backgroundImage: DecorationImage(
                    image: const Image(
                      image: AssetImage(
                        backGroundImageBox_1,
                      ),
                    ).image,
                    fit: BoxFit.cover),
                startIndex: 0,
                endIndex: 2,
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                widget.workFlowDefinitionResponse.title ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                widget.workFlowDefinitionResponse.description ?? noDescription,
                style: const TextStyle(color: MyColors.secondaryTextColor),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconLayoutWidget(
                    padding: 8.0,
                    backgroungColor:
                        MyColors.secondaryIconColor.withOpacity(0.1),
                    borderRadius: 20,
                    child: SvgPicture.asset(
                      cubeIconSVG,
                      width: 12,
                      colorFilter: ColorFilter.mode(
                          MyColors.secondaryIconColor.withOpacity(0.8),
                          BlendMode.srcIn),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    width: 100,
                    child: Stack(
                      children: [
                        for (UserResponse userResponse
                            in widget.workFlowDefinitionResponse.managers!)
                          Positioned(
                            right: position *
                                widget.workFlowDefinitionResponse.managers!
                                    .indexOf(userResponse),
                            child: Container(
                              height: 35,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: randomColor(userResponse.name!),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          )
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
