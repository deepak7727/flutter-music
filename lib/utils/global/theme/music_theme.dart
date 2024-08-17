import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';

class MusicTheme {
  static final MusicTheme instance = MusicTheme._();
  factory MusicTheme() => instance;
  MusicTheme._();

  ThemeData lightTheme() => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: ColorRes.primaryColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: ColorRes.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          scrolledUnderElevation: 0.0,
          iconTheme: IconThemeData(
            color: ColorRes.white,
            size: 30,
          ),
        ),
        scaffoldBackgroundColor: ColorRes.scaffoldBackgroundColor,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: ColorRes.black),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorRes.secondryColor,
          unselectedItemColor: ColorRes.black,
          selectedItemColor: ColorRes.primaryColor,
          selectedIconTheme: IconThemeData(color: ColorRes.primaryColor),
        ),
      );

  ThemeData darkTheme() => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: ColorRes.black,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: ColorRes.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          scrolledUnderElevation: 0.0,
          iconTheme: IconThemeData(
            color: ColorRes.white,
            size: 30,
          ),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: ColorRes.lightBlack,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: ColorRes.white),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: ColorRes.lightBlack,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorRes.black,
          unselectedItemColor: ColorRes.lightwhite,
          selectedItemColor: ColorRes.white,
          selectedIconTheme: IconThemeData(color: ColorRes.white),
        ),
      );
}
