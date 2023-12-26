import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_image_local.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/spacer.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          logoImageSVG,
          width: 100,
          height: 100,
        ),
        const SpacerWidget(),
        const Text(
          "IWORK FLOW",
          style: TextStyle(
              color: MyColors.backgroundColor,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
