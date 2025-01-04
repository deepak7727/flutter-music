import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/music_list_controller.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/utils/common/common_method.dart';
import 'package:flutter_application_1/utils/global/image_res.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

// ignore: must_be_immutable
class MusicListTile extends StatefulWidget {
  SongModel song;
  MusicListTile({super.key, required this.song});

  @override
  State<MusicListTile> createState() => _MusicListTileState();
}

class _MusicListTileState extends State<MusicListTile> {
    final MusicListController musicController = Get.put(MusicListController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteUtils.player);
        musicController.changeSong(song: widget.song);
      },
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: ColorRes.white,
              ),
              height: 35.h,
              child: Image.asset(
                ImageRes.logoImage,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                widget.song.title,
              ),
            ),
            Text(intToDuration(
                    Duration(milliseconds: widget.song.duration!).inSeconds)
                .toString()),
          ],
        ),
      ),
    );
  }

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }
}
