import 'package:flutter/material.dart';
import 'package:hsinote/app/color.dart';

class NoteTextInput extends StatelessWidget {
  const NoteTextInput({
    super.key,
    this.hintText,
    this.validator,
    this.controller,
    this.style,
    this.minLines,
  });

  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextStyle? style;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: minLines,
      maxLines: null,
      style: style,
      decoration: InputDecoration(
        hintText: hintText ?? '',
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        hintStyle: style?.merge(TextStyle(color: AppColor.grey)),
      ),
      validator: validator,
      keyboardType: TextInputType.multiline,
    );
  }
}
