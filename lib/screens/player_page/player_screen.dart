import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/music_list_controller.dart';
import 'package:flutter_application_1/screens/player_page/widget/player_action_button.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_application_1/utils/common/common_method.dart';
import 'package:flutter_application_1/utils/global/image_res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayerScreen extends StatefulWidget {
  PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen>
    with TickerProviderStateMixin {
  final MusicListController musicController = Get.put(MusicListController());
  late AnimationController _animateController;
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  ValueNotifier<Duration?> duration = ValueNotifier(Duration.zero);
  Duration? totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    setMusicToPlayer(musicController.currentSong.value!);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      player.positionStream.listen((Duration position) {
        duration.value = position;
        // print(duration.value);
        // print(Duration(
        //     milliseconds: musicController.currentSong.value!.duration!));
        print(
            "${duration.value} ==  ${Duration(milliseconds: musicController.currentSong.value!.duration!)}");
        // intToDuration(
        //     Duration(milliseconds: widget.song.duration!).inSeconds)

        if (duration.value ==
            (Duration(
                    milliseconds:
                        musicController.currentSong.value!.duration!) -
                Duration(milliseconds: 50000))) {
          showBotMessage(title: "Song finished");
          print("DEBUG -> Song Ended");
          musicController.nextSong();
          setMusicToPlayer(musicController.currentSong.value!);
        }
      });
    });
    _animateController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  void setMusicToPlayer(SongModel song) async {
    duration.value = await player.setUrl(song.data);
    totalDuration = Duration(milliseconds: song.duration!);
    player.play();
    isPlaying.value = true;
  }

  @override
  void dispose() {
    player.stop();
    _animateController.dispose();
    super.dispose();
  }

  void toggleAnimation() {
    if (isPlaying.value) {
      _animateController.repeat(); // Resume animation
    } else {
      _animateController.stop(); // Pause animation
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Styles.standardPadding,
          child: Column(
            children: [
              SizedBox(height: 100.h),
              RotationTransition(
                turns: _animateController,
                child: Image.asset(
                  ImageRes.cdImage,
                  height: 150.h,
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Obx(
                  () => Text(
                    musicController.currentSong.value!.displayName,
                    style: Styles.textStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              playerButtons(),
              SizedBox(height: 10.h),
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

  void changeSong({bool preSong = false}) {}

  Row playerButtons() {
    return Row(
      children: [
        PlayerActionButton(
          buttonIcon: Icons.skip_previous_outlined,
          buttonName: "Prev",
          action: () {
            musicController.prevSong();
            setMusicToPlayer(musicController.currentSong.value!);
            toggleAnimation();
          },
        ),
        Obx(
          () => PlayerActionButton(
            buttonIcon: isPlaying.value ? Icons.pause : Icons.play_arrow,
            buttonName: isPlaying.value ? "Pause" : "Play",
            action: () {
              if (player.playing) {
                player.pause();
                isPlaying.value = false;
              } else {
                player.play();
                isPlaying.value = true;
              }
              toggleAnimation();
            },
          ),
        ),
        PlayerActionButton(
          buttonIcon: Icons.skip_next_outlined,
          buttonName: "Next",
          action: () {
            musicController.nextSong();
            setMusicToPlayer(musicController.currentSong.value!);
            toggleAnimation();
          },
        ),
      ],
    );
  }
}
