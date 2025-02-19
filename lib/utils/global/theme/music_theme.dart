import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_res.dart';

class MusicTheme {
  static final MusicTheme instance = MusicTheme._();
  factory MusicTheme() => instance;
  MusicTheme._();

  ThemeData lightTheme() => ThemeData(
        useMaterial3: true,
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
        iconTheme: IconThemeData(color: ColorRes.black),
        scaffoldBackgroundColor: ColorRes.scaffoldBackgroundColor,
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 12, color: ColorRes.black),
          bodyMedium: TextStyle(fontSize: 14, color: ColorRes.black),
          bodyLarge: TextStyle(fontSize: 16, color: ColorRes.black),
        ),
        primaryColor: ColorRes.primaryColor,
        secondaryHeaderColor: ColorRes.secondryColor,
        popupMenuTheme: PopupMenuThemeData(color: ColorRes.white),
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
        primaryColor: ColorRes.black,
        secondaryHeaderColor: ColorRes.blueGrey,
        useMaterial3: true,
        iconTheme: IconThemeData(color: ColorRes.white),
        scaffoldBackgroundColor: ColorRes.lightBlack,
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 12, color: ColorRes.white),
          bodyMedium: TextStyle(fontSize: 14, color: ColorRes.white),
          bodyLarge: TextStyle(fontSize: 16, color: ColorRes.white),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: ColorRes.lightBlack,
        ),
        popupMenuTheme: PopupMenuThemeData(color: ColorRes.black),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorRes.black,
          unselectedItemColor: ColorRes.lightwhite,
          selectedItemColor: ColorRes.white,
          selectedIconTheme: IconThemeData(color: ColorRes.white),
        ),
      );
}
