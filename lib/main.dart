import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firebase_auth_service.dart';
import 'package:flutter_application_1/styles/color_list.dart';
import 'package:flutter_application_1/utils/global/global_res.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bot_toast/bot_toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ------ FIREBASE INITALIZATION -------------
  await FirebaseAuthService.instance.initalization();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()?.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  @override
  void initState() {
    debugPrint('****** MyAppInitState *****');
    super.initState();
  }

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: ScreenUtilInit(
        designSize: getAppSize(context),
        child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            appBarTheme: AppBarTheme(
                backgroundColor: ColorList.primaryColor,
                centerTitle: true,
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
                scrolledUnderElevation: 0.0,
                iconTheme: IconThemeData(
                  color: ColorList.white,
                  size: 30,
                )),
            scaffoldBackgroundColor: ColorList.scaffoldBackgroundColor,
          ),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: Globals.instance.appTheme,
          initialRoute: RouteUtils.splash,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          routes: RouteUtils.routes,
        ),
      ),
    );
  }

  Size getAppSize(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (width > 600 && height > 1000) {
      return const Size(800, 1280);
    } else {
      return const Size(430, 932);
    }
  }
}
