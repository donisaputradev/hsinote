import 'package:flutter/material.dart';
import 'package:hsinote/app/size.dart';
import 'package:hsinote/component/regular_text.dart';
import 'package:hsinote/extension/size_extension.dart';

class RegularTextInput extends StatelessWidget {
  const RegularTextInput({
    super.key,
    this.hintText,
    this.label,
    this.obscureText,
    this.keyboardType,
    this.validator,
    this.controller,
    this.suffixIcon,
  });

  final String? hintText;
  final String? label;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) ...[RegularText.label(label!), AppSize.s8.height],
        TextFormField(
          controller: controller,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText ?? '',
            suffixIcon: suffixIcon,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
