import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_signup/bloc/signup_cubit/signup_cubit.dart';
import 'package:flutter_ui_signup/config/custom_theme.dart';
import 'package:flutter_ui_signup/data/repository/auth_repository.dart';
import 'package:flutter_ui_signup/dependency_injection.dart';
import 'package:flutter_ui_signup/pages/_widgets/buttons/social_button.dart';
import 'package:flutter_ui_signup/pages/_widgets/custom_sized_box.dart';
import 'package:flutter_ui_signup/pages/_widgets/keyboard_dismisser.dart';
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
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseAppbarButton(),
            actions: const [
              LaterButton(),
            ],
          ),
          body: SafeArea(
            child: BlocProvider(
              create: (_) => SignUpCubit(getIt<AuthRepository>()),
              child: const _SignUpView(),
            ),
          ),
        ),
      );
}

class _SignUpView extends StatelessWidget {
  const _SignUpView();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraint) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: const Padding(
              padding: CustomTheme.contentPadding,
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: _Form(),
                    ),
                    _SocialButtons(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) => const Column(
        children: [
          PageTitle(),
          CustomSizedBox(times: 2),
          EmailInput(),
          CustomSizedBox(),
          PasswordInput(),
          CustomSizedBox(times: 2),
          SignUpButton(),
          CustomSizedBox(),
          HaveAccountButton(),
          CustomSizedBox(),
          Spacer(),
        ],
      );
}

class _SocialButtons extends StatelessWidget {
  const _SocialButtons();

  @override
  Widget build(BuildContext context) => Column(
        children: [
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
        ],
      );
}
