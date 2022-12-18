import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_signup/bloc/signup_cubit/signup_cubit.dart';
import 'package:flutter_ui_signup/config/custom_theme.dart';
import 'package:flutter_ui_signup/models/formz/email_model.dart';
import 'package:flutter_ui_signup/models/formz/password_model.dart';
import 'package:flutter_ui_signup/pages/_widgets/buttons/primary_button.dart';
import 'package:flutter_ui_signup/pages/_widgets/buttons/primary_loading_button.dart';
import 'package:flutter_ui_signup/pages/_widgets/buttons/secondary_button.dart';
import 'package:flutter_ui_signup/pages/_widgets/buttons/social_button.dart';
import 'package:flutter_ui_signup/pages/_widgets/custom_messenger.dart';
import 'package:flutter_ui_signup/pages/_widgets/custom_sized_box.dart';
import 'package:flutter_ui_signup/pages/_widgets/form/email_input.dart';
import 'package:flutter_ui_signup/pages/_widgets/form/password_input.dart';
import 'package:flutter_ui_signup/pages/home_page/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: CupertinoButton(
            onPressed: () {},
            child: const Icon(Icons.close),
          ),
          actions: [
            CupertinoButton(
              child: const Text(
                'Later',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
        body: BlocProvider(
          create: (_) => SignUpCubit(),
          child: const _SignUpView(),
        ),
      );
}

class _SignUpView extends StatelessWidget {
  const _SignUpView();

  @override
  Widget build(BuildContext context) => Padding(
        padding: CustomTheme.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Create an Account',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            const CustomSizedBox(times: 2),
            _EmailInput(),
            const CustomSizedBox(),
            _PasswordInput(),
            const CustomSizedBox(times: 2),
            _LogInButton(),
            const CustomSizedBox(),
            SecondaryButton(
              onPressed: () {},
              title: 'Already have an account?',
            ),
            const Spacer(),
            const Divider(),
            const Spacer(),
            SocialButton(
              key: const Key('googleSocialButton'),
              title: 'Continue with Google',
              iconData: FontAwesomeIcons.google,
              onPressed: () {},
            ),
            const CustomSizedBox(),
            SocialButton(
              key: const Key('facebookSocialButton'),
              title: 'Continue with Facebook',
              iconData: FontAwesomeIcons.facebook,
              onPressed: () {},
            ),
            const CustomSizedBox(),
            SocialButton(
              key: const Key('appleSocialButton'),
              title: 'Continue with Apple',
              iconData: FontAwesomeIcons.apple,
              onPressed: () {},
            ),
            const Spacer(flex: 2),
          ],
        ),
      );
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (_, state) => EmailInput(
          errorText: state.email.invalid && state.email.error != null
              ? Email.getError(state.email.error!)
              : null,
          onChanged: (String email) =>
              context.read<SignUpCubit>().emailChanged(email),
        ),
      );
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (_, state) => PasswordInput(
          errorText: state.password.invalid && state.password.error != null
              ? Password.getError(state.password.error!)
              : null,
          onChanged: (String password) =>
              context.read<SignUpCubit>().passwordChanged(password),
        ),
      );
}

class _LogInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocConsumer<SignUpCubit, SignUpState>(
        listener: (_, state) {
          if (state.status == FormzStatus.submissionSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute<void>(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false,
            );
          } else if (state.status == FormzStatus.submissionFailure) {
            CustomMessager().error(
              context: context,
              message: state.errorMessage ?? 'Ooops!',
            );
          }
        },
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (_, state) {
          if (state.status == FormzStatus.submissionInProgress ||
              state.status == FormzStatus.submissionSuccess) {
            return const PrimaryLoadingButton();
          } else {
            return PrimaryButton(
              title: 'Create an Account',
              active: state.status == FormzStatus.valid,
              onPressed: context.read<SignUpCubit>().logInWithCredentials,
            );
          }
        },
      );
}
