import 'package:flutter/material.dart';
import 'package:flutter_ui_signup/config/custom_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.title,
    required this.iconData,
    this.active = true,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData iconData;
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
                CustomTheme.white,
              ),
              overlayColor: MaterialStateProperty.all(
                CustomTheme.yellow.withOpacity(.2),
              ),
              foregroundColor: MaterialStateProperty.all(
                CustomTheme.black,
              ),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  iconData,
                  size: 24.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
