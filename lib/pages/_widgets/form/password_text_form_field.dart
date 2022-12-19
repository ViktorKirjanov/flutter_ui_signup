import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    Key? key,
    this.labelText,
    required this.errorText,
    required this.onChanged,
  }) : super(key: key);

  final String? labelText;
  final String? errorText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) => TextFormField(
        decoration: InputDecoration(
          labelText: labelText ?? 'Password',
          errorText: errorText,
        ),
        onChanged: onChanged,
      );
}
