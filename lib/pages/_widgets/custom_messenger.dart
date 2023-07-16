import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_signup/config/custom_theme.dart';

class CustomMessager {
  void error({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 5),
  }) {
    Flushbar<dynamic>(
      margin: CustomTheme.contentPadding,
      borderRadius: CustomTheme.inputRadius,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: CustomTheme.red,
      message: message,
      messageColor: CustomTheme.white,
      icon: const Icon(
        Icons.error_outline_rounded,
        size: 28.0,
        color: CustomTheme.white,
      ),
      duration: duration,
    ).show(context);
  }
}
