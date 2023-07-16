import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_signup/bloc/signup_cubit/signup_cubit.dart';
import 'package:flutter_ui_signup/models/formz/email_model.dart';
import 'package:flutter_ui_signup/pages/_widgets/form/email_text_form_field.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (_, state) => EmailTextFormField(
          errorText: state.email.displayError != null ? Email.getError(state.email.error!) : null,
          onChanged: (String email) => context.read<SignUpCubit>().emailChanged(email),
        ),
      );
}
