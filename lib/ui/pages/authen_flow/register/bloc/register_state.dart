

import 'package:equatable/equatable.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/supports/confirm_input.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/supports/data_input.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/supports/email_input.dart';
import 'package:formz/formz.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.status = FormzStatus.pure,
    this.email = const EmailInput.pure(),
    this.password = const DataInput.pure(),
    this.confirmPassword = const ConfirmInput.pure(),
  });

  final EmailInput email;
  final DataInput password;
  final ConfirmInput confirmPassword;
  final FormzStatus status;

  RegisterState copyWith({
    FormzStatus status,
    EmailInput email,
    DataInput password,
    ConfirmInput confirmPassword
  }) {
    return RegisterState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword
    );
  }
  @override
  List<Object> get props => [email, password, confirmPassword, status];

}