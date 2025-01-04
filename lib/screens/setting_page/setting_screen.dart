import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/setting_controller.dart';
import 'package:flutter_application_1/screens/setting_page/widget/setting_list_view.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_application_1/utils/global/enum_res.dart';
import 'package:flutter_application_1/utils/global/global_res.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final SettingController settingController = Get.put(SettingController());
  SettingEnum? settingOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        actions: [
          PopupMenuButton<SettingEnum>(
            initialValue: SettingEnum.dark_mode_option,
            child: Container(
              margin: EdgeInsets.only(right: 15.w),
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                color: Get.isDarkMode ? ColorRes.black : ColorRes.white,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Icon(
                Icons.person,
                color: Get.isDarkMode ? ColorRes.white : ColorRes.primaryColor,
              ),
            ),
            onSelected: (item) {
              settingOption = item;
              if (SettingEnum.dark_mode_option == item) {
                settingController.toggleTheme();
              } else {
                print('aaa **** item *** ${settingOption} ** ${item}');
              }
            },
            position: PopupMenuPosition.under,
            itemBuilder: (context) => [
              PopupMenuItem<SettingEnum>(
                value: SettingEnum.dark_mode_option,
                child: Row(
                  children: [
                    Get.isDarkMode
                        ? Icon(Icons.light_mode_outlined)
                        : Icon(Icons.dark_mode),
                    SizedBox(width: 10.w),
                    Text(
                      Get.isDarkMode ? 'Light Mode' : 'Dark Mode',
                      style: Styles.textstyle(),
                    ),
                  ],
                ),
              ),
              PopupMenuItem<SettingEnum>(
                value: SettingEnum.optionTwo,
                child: Row(
                  children: [
                    Icon(Icons.save),
                    SizedBox(width: 10.w),
                    Text(
                      'Save Data',
                      style: Styles.textstyle(),
                    ),
                  ],
                ),
              ),
              PopupMenuItem<SettingEnum>(
                value: SettingEnum.optionThree,
                child: Row(
                  children: [
                    Icon(Icons.gamepad),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Game Pad',
                      style: Styles.textstyle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          SettingListView(
            settingName: "Logout",
            settingAction: () {
              // Logout here
              Globals.instance.logout();
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
          SettingListView(
            settingName: "Color Theme",
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
