import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  void setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    setThemeData(_themeData.brightness == Brightness.light
        ? ThemeData.dark()
        : ThemeData.light());
  }

  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: MaterialColor(
      0x0B3954,
      <int, Color>{
        50: Color(0xE6F2F8),
        100: Color(0xB3D9EB),
        200: Color(0x80C5DD),
        300: Color(0x4DACCE),
        400: Color(0x2697C2),
        500: Color(0x0B3954), // Primary color
        600: Color(0x09483D),
        700: Color(0x073726),
        800: Color(0x05260F),
        900: Color(0x021B07),
      },
    ),
    hintColor: MaterialColor(
      0x087E8B,
      <int, Color>{
        50: Color(0xE0F7FA),
        100: Color(0xB2EBF2),
        200: Color(0x80DEEA),
        300: Color(0x4DD0E1),
        400: Color(0x26C6DA),
        500: Color(0x087E8B), // Primary color
        600: Color(0x006C76),
        700: Color(0x005D66),
        800: Color(0x004D57),
        900: Color(0x00363C),
      },
    ),
    appBarTheme: AppBarTheme(),
    textTheme: TextTheme(),

    // Add more customizations as needed
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.indigo,
    hintColor: Colors.deepOrange,
    appBarTheme: AppBarTheme(),
    textTheme: TextTheme(),
    // Add more customizations as needed
  );
}
