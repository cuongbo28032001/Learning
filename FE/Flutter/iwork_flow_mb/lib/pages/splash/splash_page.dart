import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_image_local.dart';
import 'package:iwork_flow_mb/pages/login/login_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scheme.background,
      body: AnimatedSplashScreen(
          duration: 1500,
          splash: SvgPicture.asset(
            logoImageSVG,
            width: 100,
            height: 100,
          ),
          splashIconSize: 200,
          nextScreen: const LoginPage(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: scheme.background),
    );
  }
}
