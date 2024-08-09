import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/setting_page/widget/setting_list_view.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';

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
            settingAction: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteUtils.signup,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
