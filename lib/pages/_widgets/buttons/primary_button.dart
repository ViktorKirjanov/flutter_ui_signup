import 'package:flutter/material.dart';
import 'package:flutter_ui_signup/config/custom_theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    this.active = true,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final bool active;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: CustomTheme.buttonHeight,
        width: double.infinity,
        child: Opacity(
          opacity: active ? 1.0 : .5,
          child: TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: CustomTheme.inputRadius,
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                CustomTheme.yellow,
              ),
              overlayColor: MaterialStateProperty.all(
                CustomTheme.white.withOpacity(.2),
              ),
              foregroundColor: MaterialStateProperty.all(
                CustomTheme.black,
              ),
            ),
            onPressed: onPressed,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      );
}
