import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/setting_page/widget/setting_list_view.dart';
import 'package:flutter_application_1/utils/global/global_data.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        actions: [
          InkWell(
            onTap: () {
              Globals.instance.changeTheme();
              MyApp.restartApp(context);
              setState(() {});
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Globals.instance.darkMode
                  ? Icon(Icons.light_mode_outlined)
                  : Icon(Icons.dark_mode),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SettingListView(
            settingName: "Logout",
            settingAction: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteUtils.login,
                (route) => false,
              );
            },
          ),
          SettingListView(
            settingName: "Register",
            settingIcon: Icons.real_estate_agent_rounded,
            settingAction: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteUtils.signup,
                (route) => false,
              );
            },
          ),
          SettingListView(
            settingName: "Profile",
            settingIcon: Icons.person_2_outlined,
            settingAction: () {
              Navigator.pushNamed(context, RouteUtils.profile);
            },
          ),
          SettingListView(
            settingName: "Tesing",
            settingIcon: Icons.terrain,
            settingAction: () {
              Navigator.pushNamed(context, RouteUtils.test);
            },
          ),
        ],
      ),
    );
  }
}
