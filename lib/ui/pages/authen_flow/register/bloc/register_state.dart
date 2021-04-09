

import 'package:equatable/equatable.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/supports/email_input.dart';
import 'package:formz/formz.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.status = FormzStatus.pure,
    this.email = const EmailInput.pure()
});

  final EmailInput email;
  final FormzStatus status;

  RegisterState copyWith({
    FormzStatus status,
    EmailInput email
  }) {
    return RegisterState(
      status: status ?? this.status,
      email: email ?? this.email,
    );
  }
  @override
  List<Object> get props => [email, status];

}