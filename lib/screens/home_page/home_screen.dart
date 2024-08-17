import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loading_page/loading_screen.dart';
import 'package:flutter_application_1/screens/music_list_page/music_list_screen.dart';
import 'package:flutter_application_1/screens/setting_page/setting_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  List<SongModel> songs = [];
  bool permissionGranded = false;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    if (await Permission.storage.request().isGranted) {
      permissionGranded = true;
      _getMusicFiles();
    } else if (await Permission.storage.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void _getMusicFiles() async {
    List<SongModel> songsList = await _audioQuery.querySongs();

    setState(() {
      songs = songsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        MusicListScreen(
          songs: songs,
        ),
        Center(
          child: LoadingScreen(),
        ),
        SettingScreen(),
      ][currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
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
    );
  }
}
