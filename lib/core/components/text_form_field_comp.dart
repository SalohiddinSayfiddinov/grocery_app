import 'package:flutter/material.dart';
import 'package:zakaz/size_config/size_config.dart';

class TextFormFeldComp {
  static InputDecoration inputDecoration(
          {String? hint, String? label, Icon? prefixIcon, var suffixIcon}) =>
      InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFEAEAEA),
          ),
          borderRadius: BorderRadius.circular(
            getHeight(100),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Color(0xFFEAEAEA),
          ),
        ),
      );
}
