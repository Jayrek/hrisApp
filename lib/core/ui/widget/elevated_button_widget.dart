import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.borderColor,
    this.fontColor = Colors.black,
  });

  final String label;
  final Function()? onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                width: 2.0,
                color: borderColor,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: fontColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }
}
