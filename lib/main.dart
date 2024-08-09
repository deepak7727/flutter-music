import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_list.dart';
import 'package:flutter_application_1/utils/global/global_data.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
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
  /// 1) our themeMode "state" field
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
                  size: 30.w,
                )),
            scaffoldBackgroundColor: ColorList.scaffoldBackgroundColor,
          ),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: Globals.instance.appTheme,
          initialRoute: RouteUtils.splash,
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
