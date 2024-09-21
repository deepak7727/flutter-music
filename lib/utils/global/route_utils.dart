import 'package:flutter_application_1/cubit/authtication/authtication_cubit.dart';
import 'package:flutter_application_1/screens/home_page/home_screen.dart';
import 'package:flutter_application_1/screens/login_page/login_screen.dart';
import 'package:flutter_application_1/screens/login_page/sp_create_account_email_screen.dart';
import 'package:flutter_application_1/screens/login_page/sp_login_screen.dart';
import 'package:flutter_application_1/screens/player_page/player_screen.dart';
import 'package:flutter_application_1/screens/profile_page/profile_screen.dart';
import 'package:flutter_application_1/screens/search_page/search_screen.dart';
import 'package:flutter_application_1/screens/signup_page/signup_screen.dart';
import 'package:flutter_application_1/screens/splash_page/splash_screen.dart';
import 'package:flutter_application_1/screens/SP_startup_screens/welcome_splash_screen.dart';
import 'package:flutter_application_1/screens/test_page/test_page_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class RouteUtils {
  static String login = '/login';
  static String signup = '/signup';
  static String home = '/home';
  static String musicList = '/musiclist';
  static String splash = '/splash';
  static String player = '/player';
  static String profile = '/profile';
  static String test = '/test';
  static String search = '/search';

  // spotify_app_routes
  static String welomeScreen = '/welcome';
  static String spLoginScreen = '/splogin';
  static String spCreateAccount = '/spcreateaccount';

  static GetPage unknownRoute = GetPage(
    name: RouteUtils.splash,
    page: () => SplashScreen(),
  );

  static List<GetPage<dynamic>>? get spotifyRoutes {
    return [
      GetPage(
        name: RouteUtils.welomeScreen,
        page: () => WelcomeSplashScreen(),
      ),
      GetPage(
        name: RouteUtils.spLoginScreen,
        page: () => SpLoginScreen(),
      ),
      GetPage(
        name: RouteUtils.spCreateAccount,
        page: () => SpCreateAccountEmailScreen(),
      ),
    ];
  }

  static List<GetPage<dynamic>>? get routes {
    return [
      GetPage(
        name: RouteUtils.splash,
        page: () => SplashScreen(),
      ),
      GetPage(
        name: RouteUtils.login,
        page: () => BlocProvider(
          create: (context) => AuthticationCubit(),
          child: LoginScreen(),
        ),
      ),
      GetPage(
        name: RouteUtils.signup,
        page: () => BlocProvider(
          create: (context) => AuthticationCubit(),
          child: SignupScreen(),
        ),
      ),
      GetPage(
        name: RouteUtils.home,
        page: () => HomeScreen(),
      ),
      GetPage(
        name: RouteUtils.search,
        page: () => SearchScreen(),
      ),
      GetPage(
        name: RouteUtils.profile,
        page: () => ProfileScreen(),
      ),
      GetPage(
        name: RouteUtils.test,
        page: () => TestPageScreen(),
      ),
      GetPage(
        name: RouteUtils.player,
        page: () => PlayerScreen(),
      ),
    ];
  }
}
