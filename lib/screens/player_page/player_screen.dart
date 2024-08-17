import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/player_page/widget/player_action_button.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_application_1/utils/common/common_method.dart';
import 'package:flutter_application_1/utils/global/image_res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayerScreen extends StatefulWidget {
  final SongModel song;
  PlayerScreen({
    super.key,
    required this.song,
  });

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen>
    with TickerProviderStateMixin {
  final player = AudioPlayer();

  ValueNotifier<Duration?> duration = ValueNotifier(Duration.zero);
  Duration? totalDuration = Duration.zero;

  @override
  void initState() {
    setMusicToPlayer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      player.positionStream.listen((Duration position) {
        duration.value = position;
      });
    });

    super.initState();
  }

  void setMusicToPlayer() async {
    duration.value = await player.setUrl(widget.song.data);
    totalDuration = Duration(milliseconds: widget.song.duration!);
    player.play();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Styles.standardPadding,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Text(
                widget.song.displayName,
                style: Styles.textstyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.h),
              Image.asset(
                ImageRes.loginImage,
                height: 300.h,
              ),
              Expanded(child: SizedBox()),
              playerButtons(),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: ValueListenableBuilder<Duration?>(
                  valueListenable: duration,
                  builder: (context, value, child) => Column(
                    children: [
                      Slider(
                        activeColor: ColorRes.accentLightBlue,
                        value: value!.inSeconds.toDouble(),
                        min: 0,
                        max: totalDuration!.inSeconds.toDouble(),
                        onChanged: (value) {
                          final newPosition = Duration(seconds: value.toInt());
                          player.seek(newPosition);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(intToDuration(value.inSeconds)),
                            Text(intToDuration(totalDuration!.inSeconds)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row playerButtons() {
    return Row(
      children: [
        PlayerActionButton(
          buttonIcon: Icons.skip_previous_outlined,
          buttonName: "Prev",
        ),
        PlayerActionButton(
          buttonIcon: Icons.pause,
          buttonName: "Pause",
          action: () {
            if (player.playing) {
              player.pause();
            } else {
              player.play();
            }
          },
        ),
        PlayerActionButton(
          buttonIcon: Icons.skip_next_outlined,
          buttonName: "Next",
        ),
      ],
    );
  }
}
