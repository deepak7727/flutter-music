import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/music_list_page/widget/music_list_tile.dart';
import 'package:flutter_application_1/screens/music_list_page/widget/no_music_widget.dart';
import 'package:flutter_application_1/utils/common/action_icon_widget.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:get/get.dart';
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
        actions: [
          ActionIconWidget(
            icon: Icons.search,
            onTap: () {
              Get.toNamed(RouteUtils.search);
            },
          ),
        ],
      ),
      body: (widget.songs.length > 0)
          ? ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: widget.songs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return MusicListTile(
                  song: widget.songs[index],
                );
              },
            )
          : NoMusicWidget(),
    );
  }
}
