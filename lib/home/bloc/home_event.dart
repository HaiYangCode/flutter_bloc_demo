import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent {}

class LoginEvent extends HomeEvent {
  String account;
  String pwd;

  LoginEvent(this.account, this.pwd);
}
