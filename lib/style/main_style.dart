import 'package:flutter/material.dart';

import 'constant.dart';

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: concrete,
  colorScheme: ColorScheme.light(primary: osloGray, secondary: bilobaFlower, onSecondary: Colors.white),
  textTheme: TextTheme(
    titleLarge: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 18, color: black),
    titleMedium: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 14, color: black),
    titleSmall: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 12, color: grey),
    bodySmall: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 14, color: grey),
  ),
);
