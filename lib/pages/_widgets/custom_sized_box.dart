import 'package:flutter/material.dart';
import 'package:flutter_ui_signup/config/custom_theme.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    super.key,
    this.times = 1,
  });

  final int times;

  @override
  Widget build(BuildContext context) =>
      SizedBox(height: CustomTheme.spacing * times);
}
