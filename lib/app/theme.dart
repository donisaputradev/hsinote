import 'package:flutter/material.dart';
import 'package:hsinote/app/color.dart';
import 'package:hsinote/app/size.dart';

class AppTheme {
  AppTheme._();

  static const _primary = AppColor.blue;
  static const _secondary = AppColor.grey;
  static const _solid = AppColor.black;
  static const _scaffold = AppColor.white;
  static const _error = AppColor.red;
  static const _divider = AppColor.lightGrey;

  static ThemeData get theme {
    return ThemeData(
      fontFamily: 'Inter',
      colorScheme: ColorScheme.light(
        primary: _primary,
        error: _error,
        secondary: _secondary,
      ),
      primaryColor: _primary,
      scaffoldBackgroundColor: _scaffold,
      cardColor: _scaffold,
      focusColor: _primary,
      shadowColor: _solid,
      dividerColor: _divider,
      elevatedButtonTheme: elevatedButtonTheme,
      textButtonTheme: textButtonTheme,
      inputDecorationTheme: inputDecorationTheme,
      appBarTheme: appBarTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      dividerTheme: dividerTheme,
    );
  }

  static DividerThemeData get dividerTheme {
    return DividerThemeData(color: _divider, thickness: 1);
  }

  static FloatingActionButtonThemeData get floatingActionButtonTheme {
    return FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s100),
      ),
    );
  }

  static AppBarTheme get appBarTheme {
    return AppBarTheme(
      backgroundColor: _scaffold,
      foregroundColor: _primary,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: AppSize.s16,
        fontWeight: FontWeight.w500,
        color: _primary,
      ),
      shape: Border(bottom: BorderSide(color: _divider)),
    );
  }

  static TextButtonThemeData get textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        textStyle: TextStyle(
          fontSize: AppSize.s14,
          fontWeight: FontWeight.w500,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.s16,
          vertical: AppSize.s12,
        ),
      ),
    );
  }

  static ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primary,
        foregroundColor: _scaffold,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        textStyle: TextStyle(
          fontSize: AppSize.s16,
          fontWeight: FontWeight.w700,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.s16,
          vertical: AppSize.s12,
        ),
      ),
    );
  }

  static InputDecorationTheme get inputDecorationTheme {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSize.s16,
        vertical: AppSize.s12,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: _secondary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: _secondary),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: _secondary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: _primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: _error),
      ),
      hintStyle: TextStyle(fontSize: AppSize.s14, color: _secondary),
    );
  }
}
