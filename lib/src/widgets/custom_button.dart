import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    @required this.onPressed,
    @required this.text,
    this.color,
    this.textColor,
    this.borderColor = Colors.transparent,
  });

  final Color color;
  final Color borderColor;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      color: color,
      textColor: textColor,
      child: Text(text),
    );
  }
}
