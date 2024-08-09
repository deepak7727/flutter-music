import 'package:flutter/material.dart';

class Globals {
  static final Globals instance = Globals._();
  factory Globals() => instance;
  Globals._();

  bool userLogin = true;
  bool darkMode = false;
  ThemeMode appTheme = ThemeMode.system;

  void changeTheme() {
    if (appTheme == ThemeMode.dark) {
      appTheme = ThemeMode.light;
    } else {
      appTheme = ThemeMode.dark;
    }
  }

}
