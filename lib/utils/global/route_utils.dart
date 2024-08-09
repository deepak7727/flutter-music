import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_page/home_screen.dart';
import 'package:flutter_application_1/screens/login_page/login_screen.dart';
import 'package:flutter_application_1/screens/player_page/player_screen.dart';
import 'package:flutter_application_1/screens/signup_page/signup_screen.dart';
import 'package:flutter_application_1/screens/splash_page/splash_screen.dart';
import 'package:on_audio_query/on_audio_query.dart';

class RouteUtils {
  static String login = '/login';
  static String signup = '/signup';
  static String home = '/home';
  static String musicList = '/musiclist';
  static String splash = '/splash';
  static String player = '/player';

  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      RouteUtils.splash: (context) => SplashScreen(),
      RouteUtils.login: (context) => LoginScreen(),
      RouteUtils.signup: (context) => SignupScreen(),
      RouteUtils.home: (context) => HomeScreen(),
      RouteUtils.player: (context) => PlayerScreen(
            song: ModalRoute.of(context)!.settings.arguments as SongModel,
          ),
    };
  }
}
