import 'package:flutter/material.dart';

abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String? user;
  final String? pass;
  final GlobalKey<FormState> globalKey;
  LoginButtonPressed({this.user, this.pass, required this.globalKey});
}
