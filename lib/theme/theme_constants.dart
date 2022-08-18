import 'package:flutter/material.dart';

ThemeData lightTheme=ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white.withOpacity(0.95),
  colorScheme: ColorScheme.light()

);

ThemeData darkTheme=ThemeData(
  brightness: Brightness.dark,
   colorScheme: ColorScheme.dark(),
   floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
 

   )
  
);