import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_signup/models/formz/email_model.dart';
import 'package:flutter_ui_signup/models/formz/password_model.dart';
import 'package:formz/formz.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

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

  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: 'Something went wrong',
        ),
      );
    }
  }
}
