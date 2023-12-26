import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_image_local.dart';
import 'package:iwork_flow_mb/pages/login/widgets/login_widget.dart';
import 'package:iwork_flow_mb/pages/login/widgets/logo_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(backGroundImage),
            fit: BoxFit.cover,
          )),
          child: const Column(
            children: [
              Expanded(
                child: Center(
                  child: LogoWidget(),
                ),
              ),
              LoginWidget()
            ],
          ),
        ),
      ),
    );
  }
}
