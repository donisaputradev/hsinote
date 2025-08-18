import 'package:flutter/material.dart';
import 'package:hsinote/app/color.dart';
import 'package:hsinote/app/size.dart';

class RegularText extends StatelessWidget {
  const RegularText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  factory RegularText.title(
    String text, {
    TextAlign? textAlign,
    TextStyle? style,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return RegularText(
      text,
      style: TextStyle(
        fontSize: AppSize.s24,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ).merge(style),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory RegularText.label(
    String text, {
    TextAlign? textAlign,
    TextStyle? style,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return RegularText(
      text,
      style: TextStyle(
        fontSize: AppSize.s14,
        fontWeight: FontWeight.w500,
        color: AppColor.black,
      ).merge(style),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: AppSize.s14,
        color: AppColor.grey,
      ).merge(style),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
