import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloseAppbarButton extends StatelessWidget {
  const CloseAppbarButton({super.key});

  @override
  Widget build(BuildContext context) => CupertinoButton(
        onPressed: () {},
        child: const Icon(Icons.close),
      );
}
