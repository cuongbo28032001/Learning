import 'dart:async';

import 'package:bloc_base/blocs/login_bloc/login_event.dart';
import 'package:bloc_base/blocs/login_bloc/login_state.dart';
import 'package:flutter/material.dart';

class LoginBloc {
  final _stateController = StreamController<LoginState>();
  Stream<LoginState> get state => _stateController.stream;

  send(LoginEvent event) {
    if (event is LoginButtonPressed) {
      if (event.globalKey.currentState!.validate()) {
        if (event.user == 'cuongbo28032001' && event.pass == 'Abc@1234') {
          _stateController.sink.add(LoginState.loading());
          Future.delayed(const Duration(seconds: 2), () {
            _stateController.sink.add(LoginState.success());
          });
        } else {
          _stateController.sink.add(LoginState.failure());
        }
      } else {
        _stateController.sink.add(LoginState.failure());
      }
    }
  }

  void navigateToHome(BuildContext context) {
    // Xử lý chuyển hướng sang màn hình Home
    Navigator.pushReplacementNamed(context, '/home');
  }

  void dispose() {
    _stateController.close();
  }
}
