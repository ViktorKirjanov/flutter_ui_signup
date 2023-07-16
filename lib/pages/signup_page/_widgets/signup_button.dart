import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_signup/bloc/signup_cubit/signup_cubit.dart';
import 'package:flutter_ui_signup/pages/_widgets/buttons/primary_button.dart';
import 'package:flutter_ui_signup/pages/_widgets/buttons/primary_loading_button.dart';
import 'package:flutter_ui_signup/pages/_widgets/custom_messenger.dart';
import 'package:flutter_ui_signup/pages/home_page/home_page.dart';
import 'package:formz/formz.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) => BlocConsumer<SignUpCubit, SignUpState>(
        listener: (_, state) {
          if (state.status == FormzSubmissionStatus.success) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute<void>(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false,
            );
          } else if (state.status == FormzSubmissionStatus.failure) {
            CustomMessager().error(
              context: context,
              message: state.errorMessage ?? 'Ooops!',
            );
          }
        },
        buildWhen: (previous, current) => previous.status != current.status || previous.isValid != current.isValid,
        builder: (_, state) {
          if (state.status == FormzSubmissionStatus.inProgress || state.status == FormzSubmissionStatus.success) {
            return const PrimaryLoadingButton();
          } else {
            return PrimaryButton(
              title: 'Create an Account',
              active: state.isValid,
              onPressed: context.read<SignUpCubit>().signUpInWithCredentials,
            );
          }
        },
      );
}
