import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/setting_page/widget/setting_list_view.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_application_1/utils/global/theme/music_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
              Get.changeTheme(Get.isDarkMode
                  ? MusicTheme.instance.lightTheme()
                  : MusicTheme.instance.darkTheme());
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Get.isDarkMode
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
              Get.offAllNamed(RouteUtils.login);
            },
          ),
          SettingListView(
            settingName: "Register",
            settingIcon: Icons.real_estate_agent_rounded,
            settingAction: () {
              Get.toNamed(RouteUtils.signup);
            },
          ),
          SettingListView(
            settingName: "Profile",
            settingIcon: Icons.person_2_outlined,
            settingAction: () {
              Get.toNamed(RouteUtils.profile);
            },
          ),
          SettingListView(
            settingName: "Tesing",
            settingIcon: Icons.terrain,
            settingAction: () {
              Get.toNamed(RouteUtils.test);
            },
          ),
        ],
      ),
    );
  }
}
