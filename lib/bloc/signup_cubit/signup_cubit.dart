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
        isValid: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> signUpInWithCredentials() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final failureOrResponse = await authRepository.signUp(state.email.value, state.password.value);
    failureOrResponse.fold(
      (failure) {
        final networkException = (failure as NetworkFailure).exception;
        final message = NetworkException.getErrorMessage(networkException);
        emit(
          state.copyWith(
            errorMessage: message,
            status: FormzSubmissionStatus.failure,
          ),
        );
      },
      (auth) => emit(
        state.copyWith(
          errorMessage: null,
          status: FormzSubmissionStatus.success,
        ),
      ),
    );
  }
}
