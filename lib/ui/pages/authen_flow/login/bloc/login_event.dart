
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  
  @override
  List<Object> get props => [];

}

class LoginUserNameChangedEvent extends LoginEvent {
  LoginUserNameChangedEvent({this.email});
  final String email;
  
  @override
  List<Object> get props => [email];
}

class LoginPasswordChangedEvent extends LoginEvent {
  LoginPasswordChangedEvent({this.password});
  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitEvent extends LoginEvent {
}