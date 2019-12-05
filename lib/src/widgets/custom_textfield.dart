import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    @required this.labelText,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
  });

  final String labelText;
  final bool autofocus;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      autofocus: autofocus,
      autocorrect: true,
      textCapitalization: textCapitalization,
    );
  }
}
