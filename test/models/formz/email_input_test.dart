import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_signup/models/formz/email_model.dart';

import '../../consts.dart';

void main() {
  group('Email', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        const email = Email.pure();
        expect(email.value, '');
        expect(email.isPure, true);
      });

      test('dirty creates correct instance', () {
        const email = Email.dirty(validEmail);
        expect(email.value, validEmail);
        expect(email.isPure, false);
      });
    });

    group('validator', () {
      test('is valid when email is not empty', () {
        expect(
          const Email.dirty(validEmail).error,
          isNull,
        );
      });

      test('is invalid when email is not valid', () {
        expect(
          const Email.dirty(invalidEmail).error,
          isNotNull,
        );
      });

      test('returns empty error when email is empty', () {
        expect(
          const Email.dirty().error,
          EmailValidationError.empty,
        );
      });

      test('returns invalid when email is invalid', () {
        expect(
          const Email.dirty(invalidEmail).error,
          EmailValidationError.invalid,
        );
      });
    });
  });
}
