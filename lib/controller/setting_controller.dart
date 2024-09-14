import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SettingController extends GetxController {
  RxBool isDarkMode = false.obs;

  ThemeMode get themeData =>
      isDarkMode.value ? ThemeMode.light : ThemeMode.dark;

  // Method to toggle theme
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}
