import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    Key? key,
    this.labelText,
    required this.errorText,
    required this.onChanged,
    required this.onEditingComplete,
  }) : super(key: key);

  final String? labelText;
  final String? errorText;
  final void Function(String) onChanged;
  final void Function() onEditingComplete;

  @override
  Widget build(BuildContext context) => TextFormField(
        decoration: InputDecoration(
          labelText: labelText ?? 'Password',
          errorText: errorText,
        ),
        textInputAction: TextInputAction.done,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
      );
}
