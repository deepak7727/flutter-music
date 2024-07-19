import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_list.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: getAppSize(context),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: ColorList.priimayColor,
            centerTitle: true,
          ),
          scaffoldBackgroundColor: ColorList.scarfoldBackgroundColor,
        ),
        initialRoute: RouteUtils.splash,
        routes: RouteUtils.routes,
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
