import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/setting_controller.dart';
import 'package:flutter_application_1/screens/setting_page/widget/setting_sub_item_view.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_application_1/utils/common/common_method.dart';
import 'package:flutter_application_1/utils/global/enum_res.dart';
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

  // @override
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
                        ? Icon(Icons.light_mode_outlined,
                            color: Theme.of(context).iconTheme.color)
                        : Icon(Icons.dark_mode,
                            color: Theme.of(context).iconTheme.color),
                    SizedBox(width: 10.w),
                    Text(
                      Get.isDarkMode ? 'Light Mode' : 'Dark Mode',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              PopupMenuItem<SettingEnum>(
                value: SettingEnum.optionTwo,
                child: Row(
                  children: [
                    Icon(Icons.save, color: Theme.of(context).iconTheme.color),
                    SizedBox(width: 10.w),
                    Text(
                      'Save Data',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              PopupMenuItem<SettingEnum>(
                value: SettingEnum.optionThree,
                child: Row(
                  children: [
                    Icon(Icons.gamepad,
                        color: Theme.of(context).iconTheme.color),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Game Pad',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: Styles.standardPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // account section
              Container(
                padding: Styles.standardPadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: ColorRes.lightBlueGrey,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: Styles.textStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorRes.black,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        SettingSubItemView(
                          title: "Profile",
                          titleIcon: Icons.person_2_outlined,
                          onTap: () {
                            showBotMessage(title: "progile opened");
                          },
                        ),
                        SettingSubItemView(
                          title: "Edit Profile",
                          titleIcon: Icons.edit,
                          onTap: () {
                            showBotMessage(title: "edit profile opened");
                          },
                        ),
                        SettingSubItemView(
                          title: "Security",
                          titleIcon: Icons.security_outlined,
                          onTap: () {
                            showBotMessage(title: "security opened");
                          },
                        ),
                        SettingSubItemView(
                          title: "Notification",
                          titleIcon: Icons.notifications,
                          onTap: () {
                            showBotMessage(title: "notification opened");
                          },
                        ),
                        SettingSubItemView(
                          title: "Privacy",
                          titleIcon: Icons.lock_open_outlined,
                          onTap: () {
                            showBotMessage(title: "privacy opened");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

              // support and abouts
              Container(
                padding: Styles.standardPadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: ColorRes.lightBlueGrey,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Support and About",
                      style: Styles.textStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorRes.black,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        SettingSubItemView(
                          title: "My Subsccription",
                          titleIcon: Icons.person_2_outlined,
                          onTap: () {
                            showBotMessage(title: "progile opened");
                          },
                        ),
                        SettingSubItemView(
                          title: "Help",
                          titleIcon: Icons.edit,
                          onTap: () {
                            showBotMessage(title: "edit profile opened");
                          },
                        ),
                        SettingSubItemView(
                          title: "Term and Condition",
                          titleIcon: Icons.security_outlined,
                          onTap: () {
                            showBotMessage(title: "security opened");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              // cacje amd cellar
              Container(
                padding: Styles.standardPadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: ColorRes.lightBlueGrey,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cache and Cellular",
                      style: Styles.textStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorRes.black,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        SettingSubItemView(
                          title: "Free up space",
                          titleIcon: Icons.person_2_outlined,
                          onTap: () {
                            showBotMessage(title: "progile opened");
                          },
                        ),
                        SettingSubItemView(
                          title: "Data Saver",
                          titleIcon: Icons.edit,
                          onTap: () {
                            showBotMessage(title: "edit profile opened");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              // actions
              Container(
                padding: Styles.standardPadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: ColorRes.lightBlueGrey,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Actions",
                      style: Styles.textStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorRes.black,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        SettingSubItemView(
                          title: "Report a problem",
                          titleIcon: Icons.person_2_outlined,
                          onTap: () {
                            showBotMessage(title: "progile opened");
                          },
                        ),
                        SettingSubItemView(
                          title: "Add a account",
                          titleIcon: Icons.edit,
                          onTap: () {
                            showBotMessage(title: "edit profile opened");
                          },
                        ),
                        SettingSubItemView(
                          title: "Log out",
                          titleIcon: Icons.edit,
                          onTap: () {
                            showBotMessage(title: "edit profile opened");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
