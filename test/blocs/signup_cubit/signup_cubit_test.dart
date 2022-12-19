import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_signup/bloc/signup_cubit/signup_cubit.dart';
import 'package:flutter_ui_signup/core/errors/failure.dart';
import 'package:flutter_ui_signup/core/errors/network_exception.dart';
import 'package:flutter_ui_signup/data/repository/auth_repository.dart';
import 'package:flutter_ui_signup/models/formz/email_model.dart';
import 'package:flutter_ui_signup/models/formz/password_model.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';

import '../../consts.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('SignUpCubit', () {
    late AuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
    });

    SignUpCubit buildBloc() => SignUpCubit(mockAuthRepository);

    void setUpMockAuthSuccess() => when(
          () => mockAuthRepository.signUp(any(), any()),
        ).thenAnswer((_) async => const Right(authResponse));

    test('works properly', () {
      expect(buildBloc, returnsNormally);
    });

    test('initialState should be Empty', () {
      // assert
      expect(buildBloc().state, equals(const SignUpState()));
    });

    group('emailChanged', () {
      blocTest<SignUpCubit, SignUpState>(
        'emits [invalid] when email/password are invalid',
        build: buildBloc,
        act: (cubit) => cubit.emailChanged(invalidEmail),
        expect: () => const <SignUpState>[
          SignUpState(
            email: Email.dirty(invalidEmail),
            status: FormzStatus.invalid,
          ),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [valid] when email/password are valid',
        build: buildBloc,
        seed: () => const SignUpState(
          password: Password.dirty(validPassword),
        ),
        act: (cubit) => cubit.emailChanged(validEmail),
        expect: () => const <SignUpState>[
          SignUpState(
            email: Email.dirty(validEmail),
            password: Password.dirty(validPassword),
            status: FormzStatus.valid,
          ),
        ],
      );
    });

    group('passwordChanged', () {
      blocTest<SignUpCubit, SignUpState>(
        'emits [invalid] when email/password are invalid',
        build: buildBloc,
        act: (cubit) => cubit.passwordChanged(invalidPassword),
        expect: () => const <SignUpState>[
          SignUpState(
            password: Password.dirty(invalidPassword),
            status: FormzStatus.invalid,
          ),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [valid] when email/password are valid',
        build: buildBloc,
        seed: () => const SignUpState(
          email: Email.dirty(validEmail),
        ),
        act: (cubit) => cubit.passwordChanged(validPassword),
        expect: () => const <SignUpState>[
          SignUpState(
            email: Email.dirty(validEmail),
            password: Password.dirty(validPassword),
            status: FormzStatus.valid,
          ),
        ],
      );
    });

    group('signUpFormSubmitted', () {
      blocTest<SignUpCubit, SignUpState>(
        'does nothing when status is not validated',
        build: buildBloc,
        act: (cubit) => cubit.signUpInWithCredentials(),
        expect: () => const <SignUpState>[],
      );

      blocTest<SignUpCubit, SignUpState>(
        'calls signUp with correct email/password',
        setUp: setUpMockAuthSuccess,
        build: buildBloc,
        seed: () => const SignUpState(
          status: FormzStatus.valid,
          email: Email.dirty(validEmail),
          password: Password.dirty(validPassword),
        ),
        act: (cubit) => cubit.signUpInWithCredentials(),
        verify: (_) => verify(
          () => mockAuthRepository.signUp(
            validEmail,
            validPassword,
          ),
        ).called(1),
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [submissionInProgress, submissionSuccess] '
        'when signUp succeeds',
        setUp: setUpMockAuthSuccess,
        build: buildBloc,
        seed: () => const SignUpState(
          status: FormzStatus.valid,
          email: Email.dirty(validEmail),
          password: Password.dirty(validPassword),
        ),
        act: (cubit) => cubit.signUpInWithCredentials(),
        expect: () => const <SignUpState>[
          SignUpState(
            status: FormzStatus.submissionInProgress,
            email: Email.dirty(validEmail),
            password: Password.dirty(validPassword),
          ),
          SignUpState(
            status: FormzStatus.submissionSuccess,
            email: Email.dirty(validEmail),
            password: Password.dirty(validPassword),
          )
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [submissionInProgress, submissionFailure] '
        'when signUp fails',
        setUp: () {
          when(
            () => mockAuthRepository.signUp(
              any(),
              any(),
            ),
          ).thenAnswer(
            (_) async =>
                Left(NetworkFailure(const NetworkException.requestCancelled())),
          );
        },
        build: buildBloc,
        seed: () => const SignUpState(
          status: FormzStatus.valid,
          email: Email.dirty(validEmail),
          password: Password.dirty(validPassword),
        ),
        act: (cubit) => cubit.signUpInWithCredentials(),
        expect: () => const <SignUpState>[
          SignUpState(
            status: FormzStatus.submissionInProgress,
            email: Email.dirty(validEmail),
            password: Password.dirty(validPassword),
          ),
          SignUpState(
            status: FormzStatus.submissionFailure,
            email: Email.dirty(validEmail),
            password: Password.dirty(validPassword),
            errorMessage: 'Request Cancelled',
          )
        ],
      );
    });
  });
}
