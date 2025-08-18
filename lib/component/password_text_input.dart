import 'package:flutter/material.dart';
import 'package:hsinote/app/color.dart';
import 'package:hsinote/app/size.dart';
import 'package:hsinote/component/regular_text_input.dart';

class PasswordTextInput extends StatefulWidget {
  const PasswordTextInput({
    super.key,
    this.hintText,
    this.label,
    this.controller,
    this.validator,
  });

  final String? hintText;
  final String? label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<PasswordTextInput> createState() => _PasswordTextInputState();
}

class _PasswordTextInputState extends State<PasswordTextInput> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return RegularTextInput(
      controller: widget.controller,
      label: widget.label,
      hintText: widget.hintText,
      obscureText: isVisible,
      keyboardType: TextInputType.visiblePassword,
      validator: widget.validator,
      suffixIcon: _buildSuffix(),
    );
  }

  Widget _buildSuffix() {
    return InkWell(
      onTap: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
      borderRadius: BorderRadius.circular(AppSize.s8),
      child: Icon(
        isVisible ? Icons.visibility_off_rounded : Icons.visibility_rounded,
        color: AppColor.grey,
      ),
    );
  }
}
