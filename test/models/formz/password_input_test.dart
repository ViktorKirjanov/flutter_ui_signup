import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_signup/models/formz/password_model.dart';

void main() {
  const validPassword = '1234abcd';
  const noDigitPassword = 'abcdabcd';
  const shortPassword = 'abc';
  const longPassword = 'abcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcd';
  const noLetterPassword = '12345678';

  group('Password', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        const password = Password.pure();
        expect(password.value, '');
        expect(password.isPure, true);
      });

      test('dirty creates correct instance', () {
        const password = Password.dirty(validPassword);
        expect(password.value, validPassword);
        expect(password.isPure, false);
      });
    });

    group('validator', () {
      test('returns empty error when password is empty', () {
        expect(
          const Password.dirty().error,
          PasswordValidationError.empty,
        );
      });

      test('is valid when password is not empty', () {
        expect(
          const Password.dirty(validPassword).error,
          isNull,
        );
      });

      test('is invalid when password is not invalid', () {
        expect(
          const Password.dirty(noDigitPassword).error,
          isNotNull,
        );
      });

      test('returns short when password is short', () {
        expect(
          const Password.dirty(shortPassword).error,
          PasswordValidationError.short,
        );
      });

      test('returns long when password is long', () {
        expect(
          const Password.dirty(longPassword).error,
          PasswordValidationError.long,
        );
      });

      test('returns noDigit when password with no digit', () {
        expect(
          const Password.dirty(noDigitPassword).error,
          PasswordValidationError.noDigit,
        );
      });

      test('returns noLetter when password with no letter', () {
        expect(
          const Password.dirty(noLetterPassword).error,
          PasswordValidationError.noLetter,
        );
      });
    });
  });
}
