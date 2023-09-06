import 'package:flutter/material.dart';

class WrapTextButton extends StatelessWidget {
  const WrapTextButton({
    required this.leadingText,
    required this.buttonText,
    required this.onPressed,
    super.key,
  });

  final String leadingText;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(leadingText),
        TextButton(
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      ],
    );
  }
}
