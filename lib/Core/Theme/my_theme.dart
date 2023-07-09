import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme{
  static const Color primarycolor = Color(0xff004182);

  static ThemeData lightTheme = ThemeData(
      bottomAppBarTheme: BottomAppBarTheme(
          color: primarycolor
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: Colors.transparent
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0
      ),
      primaryColor: const Color(0xff004182),
      textTheme: const TextTheme(
        labelLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: primarycolor
        ),
        labelSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: primarycolor
        ),
      )
  );
}