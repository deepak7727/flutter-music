import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/music_list_page/music_list_tile.dart';
import 'package:on_audio_query/on_audio_query.dart';

// ignore: must_be_immutable
class MusicListScreen extends StatefulWidget {
  List<SongModel> songs;
  MusicListScreen({super.key, required this.songs});

  @override
  State<MusicListScreen> createState() => _MusicListScreenState();
}

class _MusicListScreenState extends State<MusicListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: widget.songs.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return MusicListTile(
            song: widget.songs[index],
          );
        },
      ),
    );
  }
}
