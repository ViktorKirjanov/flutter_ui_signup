import 'package:flutter/cupertino.dart';

class LaterButton extends StatelessWidget {
  const LaterButton({super.key});

  @override
  Widget build(BuildContext context) => CupertinoButton(
        child: const Text(
          'Later',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () {},
      );
}
