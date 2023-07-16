import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_signup/bloc/signup_cubit/signup_cubit.dart';
import 'package:flutter_ui_signup/models/formz/password_model.dart';
import 'package:flutter_ui_signup/pages/_widgets/form/password_text_form_field.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (_, state) => PasswordTextFormField(
          errorText: state.password.displayError != null ? Password.getError(state.password.error!) : null,
          onChanged: (String password) => context.read<SignUpCubit>().passwordChanged(password),
          onEditingComplete: () {
            context.read<SignUpCubit>().signUpInWithCredentials();
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      );
}
