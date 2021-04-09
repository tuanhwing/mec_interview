

import 'package:formz/formz.dart';
import 'package:flutter_app_interview/core/extension/mec_string_extension.dart';

enum EmailInputError { invalid }

class EmailInput extends FormzInput<String, EmailInputError> {
  // Call super.pure to represent an unmodified form input.
  const EmailInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  @override
  EmailInputError validator(String value) {
    if (value == null || value.isEmpty || !value.isValidEmail()) {
      return EmailInputError.invalid;
    }
    return null;
  }

}