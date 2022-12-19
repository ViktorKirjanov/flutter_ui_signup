import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) => const Text(
        'Create an Account',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
}
