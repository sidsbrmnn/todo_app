import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    @required this.labelText,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged = null,
    this.cursorColor,
  });

  final String labelText;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final Function onChanged;
  final Color cursorColor;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      autofocus: autofocus,
      autocorrect: true,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      cursorColor: cursorColor,
    );
  }
}
