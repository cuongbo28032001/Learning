// ignore_for_file: must_be_immutable

import 'package:bloc_base/blocs/login_bloc/login_bloc.dart';
import 'package:bloc_base/blocs/login_bloc/login_event.dart';
import 'package:bloc_base/blocs/login_bloc/login_state.dart';
import 'package:bloc_base/utils/enum_validate.dart';
import 'package:bloc_base/views/login_view/login_element_widgets/form_input_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _loginForm = GlobalKey<FormState>();
  var loginBloc = LoginBloc();

  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerPassWord = TextEditingController();

  _onpressed() {
    loginBloc.send(LoginButtonPressed(
        user: _controllerUserName.text,
        pass: _controllerPassWord.text,
        globalKey: _loginForm));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Bloc Base"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[100],
        ),
        body: renderBodyLogin(context));
  }

  renderBodyLogin(context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        StreamBuilder(
          stream: loginBloc.state,
          initialData: LoginState.initial(),
          builder: (context, snapshot) {
            if (snapshot.data!.isSuccess) {
              loginBloc.navigateToHome(context);
              return Container();
            }
            return Stack(
              children: [
                Form(
                  key: _loginForm,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: FormInputWidget(
                          controller: _controllerUserName,
                          enumValidate: EnumValidate.USERNAME,
                          hinText: "Enter username",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: FormInputWidget(
                          controller: _controllerPassWord,
                          enumValidate: EnumValidate.PASSWORD,
                          hinText: "Enter password",
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
                if (snapshot.data!.isLoading) const CircularProgressIndicator(),
              ],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: ElevatedButton(
              onPressed: _onpressed,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text('login'),
                ),
              )),
        ),
      ],
    ));
  }
}
