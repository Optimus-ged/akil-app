import 'package:flutter/material.dart';

import 'fonts.dart';
import 'text_theme.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: Fonts.plusJakartaSansRegular,
  textTheme: plusJakartaSansTextTheme,
  
  colorScheme: ColorScheme.dark(
    surface: Colors.white,
    brightness: Brightness.light,
    onSurface: Colors.black,
    primary: Colors.grey[200]!,
    secondary: Colors.grey[200]!,
  ),
);
