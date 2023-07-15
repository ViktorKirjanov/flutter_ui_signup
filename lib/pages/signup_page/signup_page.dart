import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_signup/bloc/signup_cubit/signup_cubit.dart';
import 'package:flutter_ui_signup/config/custom_theme.dart';
import 'package:flutter_ui_signup/data/repository/auth_repository.dart';
import 'package:flutter_ui_signup/dependency_injection.dart';
import 'package:flutter_ui_signup/pages/_widgets/buttons/social_button.dart';
import 'package:flutter_ui_signup/pages/_widgets/custom_sized_box.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/close_button.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/email_input.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/have_account_button.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/later_button.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/page_title.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/password_input.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/signup_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const CloseAppbarButton(),
          actions: const [
            LaterButton(),
          ],
        ),
        body: BlocProvider(
          create: (_) => SignUpCubit(getIt<AuthRepository>()),
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
            const PageTitle(),
            const CustomSizedBox(times: 2),
            const EmailInput(),
            const CustomSizedBox(),
            const PasswordInput(),
            const CustomSizedBox(times: 2),
            const SignUpButton(),
            const CustomSizedBox(),
            const HaveAccountButton(),
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

// class _EmailInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => BlocBuilder<SignUpCubit, SignUpState>(
//         buildWhen: (previous, current) => previous.email != current.email,
//         builder: (_, state) => EmailTextFormField(
//           errorText: state.email.invalid && state.email.error != null
//               ? Email.getError(state.email.error!)
//               : null,
//           onChanged: (String email) =>
//               context.read<SignUpCubit>().emailChanged(email),
//         ),
//       );
// }

// class _PasswordInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => BlocBuilder<SignUpCubit, SignUpState>(
//         buildWhen: (previous, current) => previous.password != current.password,
//         builder: (_, state) => PasswordTextFormField(
//           errorText: state.password.invalid && state.password.error != null
//               ? Password.getError(state.password.error!)
//               : null,
//           onChanged: (String password) =>
//               context.read<SignUpCubit>().passwordChanged(password),
//         ),
//       );
// }

// class _LogInButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => BlocConsumer<SignUpCubit, SignUpState>(
//         listener: (_, state) {
//           if (state.status == FormzStatus.submissionSuccess) {
//             Navigator.of(context).pushAndRemoveUntil(
//               MaterialPageRoute<void>(builder: (context) => const HomePage()),
//               (Route<dynamic> route) => false,
//             );
//           } else if (state.status == FormzStatus.submissionFailure) {
//             CustomMessager().error(
//               context: context,
//               message: state.errorMessage ?? 'Ooops!',
//             );
//           }
//         },
//         buildWhen: (previous, current) => previous.status != current.status,
//         builder: (_, state) {
//           if (state.status == FormzStatus.submissionInProgress ||
//               state.status == FormzStatus.submissionSuccess) {
//             return const PrimaryLoadingButton();
//           } else {
//             return PrimaryButton(
//               title: 'Create an Account',
//               active: state.email.valid && state.password.valid,
//               onPressed: context.read<SignUpCubit>().signUpInWithCredentials,
//             );
//           }
//         },
//       );
// }
