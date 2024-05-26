import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_page/home_screen.dart';
import 'package:flutter_application_1/screens/login_page/login_screen.dart';
import 'package:flutter_application_1/screens/music_list_page/music_list_screen.dart';
import 'package:flutter_application_1/styles/color_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorList.priimayColor,
        ),
        scaffoldBackgroundColor: ColorList.scarfoldBackgroundColor,
      ),
      home: HomeScreen(),
      initialRoute: "/login",
      routes: {
        '/login' : (context) => LoginScreen(),
        '/musiclist' : (context) => MusicListScreen(),
        '/home' : (context) => HomeScreen(),
      },
    );
  }
}
