import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/player_page/widget/player_action_button.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_application_1/utils/global/image_res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  late AnimationController controller;

  @override
  void initState() {
    debugPrint('****** song =  ${widget.song.toString()} *****');
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
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
              LinearProgressIndicator(
                value: controller.value,
                semanticsLabel: 'Linear progress indicator',
              ),
              SizedBox(
                height: 20.h,
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
        ),
        PlayerActionButton(
          buttonIcon: Icons.skip_next_outlined,
          buttonName: "Next",
        ),
      ],
    );
  }
}
