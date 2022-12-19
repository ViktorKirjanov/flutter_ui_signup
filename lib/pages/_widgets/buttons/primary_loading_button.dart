import 'package:flutter/material.dart';
import 'package:flutter_ui_signup/config/custom_theme.dart';

class PrimaryLoadingButton extends StatelessWidget {
  const PrimaryLoadingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: CustomTheme.buttonHeight,
        width: double.infinity,
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
          child: const SizedBox(
            height: 16.0,
            width: 16.0,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
            ),
          ),
          onPressed: () {},
        ),
      );
}
