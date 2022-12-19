import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_signup/core/errors/failure.dart';
import 'package:flutter_ui_signup/core/errors/network_exception.dart';
import 'package:flutter_ui_signup/data/repository/auth_repository.dart';
import 'package:flutter_ui_signup/models/formz/email_model.dart';
import 'package:flutter_ui_signup/models/formz/password_model.dart';
import 'package:formz/formz.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepository) : super(const SignUpState());

  final AuthRepository authRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> signUpInWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final failureOrResponse =
        await authRepository.signUp(state.email.value, state.password.value);
    failureOrResponse.fold(
      (failure) {
        final networkException = (failure as NetworkFailure).exception;
        final message = NetworkException.getErrorMessage(networkException);
        emit(
          state.copyWith(
            errorMessage: message,
            status: FormzStatus.submissionFailure,
          ),
        );
      },
      (auth) => emit(
        state.copyWith(
          errorMessage: null,
          status: FormzStatus.submissionSuccess,
        ),
      ),
    );
  }
}
