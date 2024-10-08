import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loading_page/loading_screen.dart';
import 'package:flutter_application_1/screens/music_list_page/music_list_screen.dart';
import 'package:flutter_application_1/screens/setting_page/setting_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool permissionGranded = false;
  RxInt currentPage = 0.obs;

  @override
  void initState() {
    _requestPermission();
    super.initState();
  }

  Future<void> _requestPermission() async {
    if (await Permission.storage.request().isGranted) {
      permissionGranded = true;
    } else if (await Permission.storage.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: [
          MusicListScreen(),
          Center(child: LoadingScreen()),
          SettingScreen(),
        ][currentPage.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage.value,
          onTap: (index) {
            currentPage.value = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.music_note,
              ),
              label: "Music List",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.music_video),
              label: "Music ALbum",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Setting",
            ),
          ],
          iconSize: 25.h,
        ),
      ),
    );
  }
}
