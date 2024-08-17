import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/authtication/authtication_cubit.dart';
import 'package:flutter_application_1/screens/home_page/home_screen.dart';
import 'package:flutter_application_1/screens/login_page/login_screen.dart';
import 'package:flutter_application_1/screens/player_page/player_screen.dart';
import 'package:flutter_application_1/screens/profile_page/profile_screen.dart';
import 'package:flutter_application_1/screens/signup_page/signup_screen.dart';
import 'package:flutter_application_1/screens/splash_page/splash_screen.dart';
import 'package:flutter_application_1/screens/test_page/test_page_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

class RouteUtils {
  static String login = '/login';
  static String signup = '/signup';
  static String home = '/home';
  static String musicList = '/musiclist';
  static String splash = '/splash';
  static String player = '/player';
  static String profile = '/profile';
  static String test = '/test';

  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      RouteUtils.splash: (context) => SplashScreen(),
      RouteUtils.login: (context) => BlocProvider(
            create: (context) => AuthticationCubit(),
            child: LoginScreen(),
          ),
      RouteUtils.signup: (context) => BlocProvider(
            create: (context) => AuthticationCubit(),
            child: SignupScreen(),
          ),
      RouteUtils.home: (context) => HomeScreen(),
      RouteUtils.profile: (context) => ProfileScreen(),
      RouteUtils.test: (context) => TestPageScreen(),
      RouteUtils.player: (context) => PlayerScreen(
            song: ModalRoute.of(context)!.settings.arguments as SongModel,
          ),
    };
  }
}
