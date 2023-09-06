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
                width: 1,
                color: borderColor,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: fontColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
