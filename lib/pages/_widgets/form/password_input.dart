import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key,
    this.labelText,
    required this.errorText,
    required this.onChanged,
  }) : super(key: key);

  final String? labelText;
  final String? errorText;
  final void Function(String) onChanged;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) => TextFormField(
        decoration: InputDecoration(
          labelText: widget.labelText ?? 'Password',
          errorText: widget.errorText,
        ),
        onChanged: widget.onChanged,
      );
}
