import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    Key? key,
    required this.errorText,
    required this.onChanged,
  }) : super(key: key);
  final String? errorText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) => TextFormField(
        key: const Key('emailInputKey'),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email Address',
          errorText: errorText,
        ),
        onChanged: onChanged,
      );
}
