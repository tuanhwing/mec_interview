
import 'package:equatable/equatable.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/supports/data_input.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/supports/email_input.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {

  const LoginState({
    this.status = FormzStatus.pure,
    this.password = const DataInput.pure(),
    this.email = const EmailInput.pure()
  });

  final EmailInput email;
  final DataInput password;
  final FormzStatus status;

  LoginState copyWith({
    FormzStatus status,
    EmailInput email,
    DataInput password
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password
    );
  }

  @override
  List<Object> get props => [status, email, password];

}