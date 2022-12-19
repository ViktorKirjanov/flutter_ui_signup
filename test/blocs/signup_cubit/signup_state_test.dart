import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_signup/bloc/signup_cubit/signup_cubit.dart';
import 'package:flutter_ui_signup/models/formz/email_model.dart';
import 'package:flutter_ui_signup/models/formz/password_model.dart';
import 'package:formz/formz.dart';

void main() {
  const email = Email.dirty('email');
  const passwordString = 'password';
  const password = Password.dirty(passwordString);
  const errorMessage = 'Error';

  group('SignUpState', () {
    test('supports value comparisons', () {
      expect(const SignUpState(), const SignUpState());
    });

    test('returns same object when no properties are passed', () {
      expect(const SignUpState().copyWith(), const SignUpState());
    });

    group('returns object with updated status when status is passed.', () {
      test('pure', () {
        expect(
          const SignUpState().copyWith(status: FormzStatus.pure),
          const SignUpState(),
        );
      });

      test('invalid', () {
        expect(
          const SignUpState().copyWith(status: FormzStatus.invalid),
          const SignUpState(status: FormzStatus.invalid),
        );
      });

      test('submissionCanceled', () {
        expect(
          const SignUpState().copyWith(status: FormzStatus.submissionCanceled),
          const SignUpState(status: FormzStatus.submissionCanceled),
        );
      });

      test('submissionFailure', () {
        expect(
          const SignUpState().copyWith(status: FormzStatus.submissionFailure),
          const SignUpState(status: FormzStatus.submissionFailure),
        );
      });

      test('submissionInProgress', () {
        expect(
          const SignUpState()
              .copyWith(status: FormzStatus.submissionInProgress),
          const SignUpState(status: FormzStatus.submissionInProgress),
        );
      });

      test('submissionSuccess', () {
        expect(
          const SignUpState().copyWith(status: FormzStatus.submissionSuccess),
          const SignUpState(status: FormzStatus.submissionSuccess),
        );
      });

      test('valid', () {
        expect(
          const SignUpState().copyWith(status: FormzStatus.valid),
          const SignUpState(status: FormzStatus.valid),
        );
      });
    });

    test('returns object with updated email when email is passed', () {
      expect(
        const SignUpState().copyWith(email: email),
        const SignUpState(email: email),
      );
    });

    test('returns object with updated password when password is passed', () {
      expect(
        const SignUpState().copyWith(password: password),
        const SignUpState(password: password),
      );
    });

    test('returns object with updated errorMessage when errorMessage is passed',
        () {
      expect(
        const SignUpState().copyWith(errorMessage: errorMessage),
        const SignUpState(errorMessage: errorMessage),
      );
    });
  });
}
