import 'package:flutter/material.dart';
import 'package:shopping/presentation/common/common.dart';

ThemeData themeData() {
  return ThemeData(
    fontFamily: "NotoSans",
    inputDecorationTheme: _inputDecoration(),
  );
}

InputDecorationTheme _inputDecoration() {
  return InputDecorationTheme(
    filled: true,
    fillColor: MyColor.colorInput,
    contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
