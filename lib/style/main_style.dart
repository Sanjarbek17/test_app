import 'package:flutter/material.dart';

import 'constant.dart';

ThemeData theme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: shark,
    secondary: bilobaFlower,
    onSecondary: Colors.white,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: black,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: silverSand,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: grey,
    ),
  ),
);
