import 'package:flutter/material.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {
  HomeInitial();
}


class LoginResult extends HomeState {
  String result;

  LoginResult(this.result);
}
