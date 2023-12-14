import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;

  final TextStyle? textStyle;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final Widget? suffix;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  CustomTextFormField({
    Key? key,
    this.controller,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.suffix,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: textStyle,
      decoration: decoration,
      validator: validator,
    );
  }

  InputDecoration get decoration => InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefix,
        suffixIcon: suffix,
        fillColor: Colors.white,
        filled: filled,
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
      );
}
