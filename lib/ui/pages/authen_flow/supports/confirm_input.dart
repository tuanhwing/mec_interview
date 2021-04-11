
import 'package:formz/formz.dart';

enum ConfirmInputError { invalid }

class ConfirmInput extends FormzInput<String, ConfirmInputError> {
  // Call super.pure to represent an unmodified form input.
  const ConfirmInput.pure({this.originValue}) : super.pure('');

  // Call super.dirty to represent a modified form input.
  const ConfirmInput.dirty({String value = '', this.originValue}) : super.dirty(value);

  final String originValue;

  @override
  ConfirmInputError validator(String value) {
    if (value == null || value.trim().isEmpty || value.trim() != originValue) {
      return ConfirmInputError.invalid;
    }
    return null;
  }
}