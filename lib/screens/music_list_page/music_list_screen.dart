import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/music_list_controller.dart';
import 'package:flutter_application_1/screens/music_list_page/widget/music_list_tile.dart';
import 'package:flutter_application_1/screens/music_list_page/widget/no_music_widget.dart';
import 'package:flutter_application_1/utils/common/action_icon_widget.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:get/get.dart';

class MusicListScreen extends StatefulWidget {
  MusicListScreen({super.key});

  @override
  State<MusicListScreen> createState() => _MusicListScreenState();
}

class _MusicListScreenState extends State<MusicListScreen> {
  final MusicListController musicController = Get.put(MusicListController());


  @override
  void initState() {
    musicController.fetchMusic();
    super.initState();
  }

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
      body: Obx(
        () => (musicController.songs.length > 0)
            ? ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: musicController.songs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return MusicListTile(
                    song: musicController.songs[index],
                  );
                },
              )
            : NoMusicWidget(),
      ),
    );
  }
}
