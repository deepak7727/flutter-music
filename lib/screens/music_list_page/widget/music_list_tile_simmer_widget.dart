import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/common/common_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_audio_query/on_audio_query.dart';

// ignore: must_be_immutable
class MusicListTileSimmerWidget extends StatelessWidget {
  SongModel song;
  MusicListTileSimmerWidget({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              song.title,
            ),
          ),
          Text(intToDuration(
                  Duration(milliseconds: song.duration!).inSeconds)
              .toString()),
        ],
      ),
    );
  }

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }
}
