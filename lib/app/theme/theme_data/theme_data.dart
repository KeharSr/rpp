
import 'package:flutter/material.dart';
import 'package:rpp/app/theme/custom_themes/app_bar_theme.dart';
import 'package:rpp/app/theme/custom_themes/bottom_navigator_bar_theme.dart';
import 'package:rpp/app/theme/custom_themes/elevated_button_theme.dart';
import 'package:rpp/app/theme/custom_themes/text_field_theme.dart';
import 'package:rpp/app/theme/custom_themes/text_theme.dart';

class KAppTheme {
  KAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: KTextTheme.lightTextTheme,
    elevatedButtonTheme: KElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: KAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: KTextFieldTheme.lightInputDecorationTheme,
    bottomNavigationBarTheme:
        KBottomNavigatorBarTheme.lightBottomNavigatorBarTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: KTextTheme.darkTextTheme,
    elevatedButtonTheme: KElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: KAppBarTheme.darkAppBarTheme,
    inputDecorationTheme: KTextFieldTheme.darkInputDecorationTheme,
    bottomNavigationBarTheme:
        KBottomNavigatorBarTheme.darkBottomNavigatorBarTheme,
  );
}
