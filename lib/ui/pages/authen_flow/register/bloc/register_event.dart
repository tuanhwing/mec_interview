

import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];

}

class RegisterUsernameChangedEvent extends RegisterEvent {
  RegisterUsernameChangedEvent({this.username});
  final String username;

  @override
  List<Object> get props => [username];
}

class RegisterPasswordChangedEvent extends RegisterEvent {
  RegisterPasswordChangedEvent({this.password});
  final String password;

  @override
  List<Object> get props => [password];
}

class RegisterConfirmPasswordChangedEvent extends RegisterEvent {
  RegisterConfirmPasswordChangedEvent({this.confirmPassword});
  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}


class RegisterSubmitEvent extends RegisterEvent {
}