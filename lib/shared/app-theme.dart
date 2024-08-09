import 'package:flutter/material.dart';

class AppTheme {

  static const inputTextColor = TextStyle(color: Color(0xFFEEEEEE));

  static InputDecoration formDecoration(String labelText){
    return InputDecoration(
        labelStyle: TextStyle(color: Color(0xFFEEEEEE)),
        filled: true,
        fillColor: Color(0x77FFFFFF),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30)),
        labelText: labelText);
  }
}