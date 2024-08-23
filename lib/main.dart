import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firebase_auth_service.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_application_1/utils/global/theme/music_theme.dart';
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

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    debugPrint('****** MyAppInitState *****');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: getAppSize(context),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: MusicTheme.instance.lightTheme(),
        darkTheme: MusicTheme.instance.darkTheme(),
        initialRoute: RouteUtils.splash,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        getPages: RouteUtils.routes,
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
