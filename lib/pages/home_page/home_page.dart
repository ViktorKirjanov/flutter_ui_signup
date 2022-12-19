import 'package:flutter/material.dart';
import 'package:flutter_ui_signup/config/custom_theme.dart';
import 'package:flutter_ui_signup/pages/_widgets/buttons/primary_button.dart';
import 'package:flutter_ui_signup/pages/signup_page/signup_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Home page')),
        body: Padding(
          padding: CustomTheme.pagePadding,
          child: Center(
            child: PrimaryButton(
              title: 'Logout',
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute<void>(
                  builder: (context) => const SignUpPage(),
                ),
                (Route<dynamic> route) => false,
              ),
            ),
          ),
        ),
      );
}
