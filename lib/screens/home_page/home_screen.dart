import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  List songs = [];
  bool permissionGranded = false;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    if (await Permission.storage.request().isGranted) {
      // Permission is granted, you can read the files
      print("::::::  perission Accept");
      permissionGranded = true;
      _getMusicFiles();
    } else if (await Permission.storage.isPermanentlyDenied) {
      // Permission is permanently denied, you need to open the app settings
      print('permission denied');
      openAppSettings();
    }
  }

  void _getMusicFiles() async {
    // Implement your logic to get music files here
    List<SongModel> songsList = await _audioQuery.querySongs();

    setState(() {
      songs = songsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: Center(
        child: Text("${songs.length}"),
      ),
    );
  }
}
