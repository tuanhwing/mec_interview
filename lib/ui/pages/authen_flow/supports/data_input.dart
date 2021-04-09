
import 'package:formz/formz.dart';

enum DataInputError { empty }

class DataInput extends FormzInput<String, DataInputError> {
  // Call super.pure to represent an unmodified form input.
  const DataInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const DataInput.dirty({String value = ''}) : super.dirty(value);

  @override
  DataInputError validator(String value) {
    return value?.isEmpty == true ? DataInputError.empty : null;
  }

}