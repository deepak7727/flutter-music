import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/music_list_page/widget/music_list_tile.dart';
import 'package:flutter_application_1/screens/music_list_page/widget/no_music_widget.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_audio_query/on_audio_query.dart';

// ignore: must_be_immutable
class MusicListScreen extends StatefulWidget {
  List<SongModel> songs;
  MusicListScreen({super.key, required this.songs});

  @override
  State<MusicListScreen> createState() => _MusicListScreenState();
}

class _MusicListScreenState extends State<MusicListScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextField(
              controller: searchController,
              onTap: (){
                debugPrint('****** action clicked search bar  *****');
              },
              decoration: InputDecoration(
                hintText: "Search song",
                fillColor: Colors.amber,
                hintStyle: Styles.textstyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          (widget.songs.length > 0)
              ? Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: widget.songs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MusicListTile(
                        song: widget.songs[index],
                      );
                    },
                  ),
                )
              : NoMusicWidget()
        ],
      ),
    );
  }
}
