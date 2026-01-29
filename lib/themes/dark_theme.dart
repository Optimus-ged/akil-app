import 'fonts.dart';
import 'text_theme.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: Fonts.plusJakartaSansRegular,
  textTheme: plusJakartaSansTextTheme,
  colorScheme: ColorScheme.dark(
    surface: Colors.black,
    brightness: Brightness.dark,
    onSurface: Colors.grey[100]!,
    primary: Colors.grey[900]!,
    onPrimary: Colors.grey[600]!,
    secondary: Colors.grey[900]!,
  ),
);
