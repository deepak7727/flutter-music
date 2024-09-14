import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_controller.dart';
import 'package:flutter_application_1/screens/music_list_page/widget/music_list_tile.dart';
import 'package:flutter_application_1/screens/music_list_page/widget/no_music_widget.dart';
import 'package:flutter_application_1/screens/search_page/widget/search_bar_textfield.dart';
import 'package:flutter_application_1/utils/common/action_icon_widget.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  final MusicListController homeController = Get.put(MusicListController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: SearchBarTextfield(
            controller: searchController,
            hint: "Search",
            onChanged: (value) => homeController.searchSong(query: value),
          ),
          actions: [
            (searchController.text == "")
                ? ActionIconWidget(
                    icon: Icons.search,
                    onTap: () {},
                  )
                : ActionIconWidget(
                    icon: Icons.cancel,
                    onTap: () {},
                  ),
          ],
        ),
        body: (homeController.foundSongs.length > 0)
            ? ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: homeController.foundSongs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return MusicListTile(
                    song: homeController.foundSongs[index],
                  );
                },
              )
            : NoMusicWidget(),
      ),
    );
  }
}
