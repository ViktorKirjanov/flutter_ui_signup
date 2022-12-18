import 'package:formz/formz.dart';

enum PasswordValidationError { empty, short, long, noDigit, noLetter }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (value.length < 8) {
      return PasswordValidationError.short;
    } else if (value.length > 30) {
      return PasswordValidationError.long;
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return PasswordValidationError.noDigit;
    } else if (!value.contains(RegExp(r'[a-zA-Z]'))) {
      return PasswordValidationError.noLetter;
    }
    return null;
  }

  static String getError(PasswordValidationError value) {
    switch (value) {
      case PasswordValidationError.empty:
        return 'Password can not be empty';
      case PasswordValidationError.short:
        return 'Password is to short';
      case PasswordValidationError.long:
        return 'Password is to long';
      case PasswordValidationError.noDigit:
        return 'Password has no digits';
      case PasswordValidationError.noLetter:
        return 'Password has no letters';
    }
  }
}
