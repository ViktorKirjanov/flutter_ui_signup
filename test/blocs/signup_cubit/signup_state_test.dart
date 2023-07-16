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
          const SignUpState().copyWith(status: FormzSubmissionStatus.initial),
          const SignUpState(),
        );
      });

      test('invalid', () {
        expect(
          const SignUpState().copyWith(status: FormzSubmissionStatus.failure),
          const SignUpState(status: FormzSubmissionStatus.failure),
        );
      });

      test('submissionCanceled', () {
        expect(
          const SignUpState().copyWith(status: FormzSubmissionStatus.canceled),
          const SignUpState(status: FormzSubmissionStatus.canceled),
        );
      });

      test('submissionFailure', () {
        expect(
          const SignUpState().copyWith(status: FormzSubmissionStatus.failure),
          const SignUpState(status: FormzSubmissionStatus.failure),
        );
      });

      test('submissionInProgress', () {
        expect(
          const SignUpState().copyWith(status: FormzSubmissionStatus.inProgress),
          const SignUpState(status: FormzSubmissionStatus.inProgress),
        );
      });

      test('submissionSuccess', () {
        expect(
          const SignUpState().copyWith(status: FormzSubmissionStatus.success),
          const SignUpState(status: FormzSubmissionStatus.success),
        );
      });

      test('valid', () {
        expect(
          const SignUpState().copyWith(isValid: true),
          const SignUpState(isValid: true),
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

    test('returns object with updated errorMessage when errorMessage is passed', () {
      expect(
        const SignUpState().copyWith(errorMessage: errorMessage),
        const SignUpState(errorMessage: errorMessage),
      );
    });
  });
}
