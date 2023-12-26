import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iwork_flow_mb/pages/App.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_icon_local.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/spacer.dart';

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const App()));
          },
          child: const SizedBox(
            width: double.infinity,
            height: 50,
            child: Center(
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        const SpacerWidget(),
        Text(
          'OR',
          style: TextStyle(
              color: MyColors.secondaryTextColor.withOpacity(0.5),
              fontWeight: FontWeight.bold),
        ),
        const SpacerWidget(),
        ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
                  MaterialStateProperty.all(MyColors.buttonHintColor)),
          onPressed: () {},
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(googleIconSVG),
                const SpacerWidget(
                  width: 16.0,
                ),
                const Text(
                  "Continue with Google",
                  style: TextStyle(
                      color: MyColors.secondaryTextColor, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
