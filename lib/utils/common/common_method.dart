import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';

void debugPrintLocal(String msg) {
  if (kDebugMode) {
    print(msg);
  }
}

void showToast({required String title, String? message, bool isError = false}) {
  BotToast.showSimpleNotification(
    backgroundColor: isError ? ColorRes.danger : ColorRes.white,
    title: title,
    titleStyle: isError
        ? Styles.textstyle(color: ColorRes.white, fontSize: 20)
        : Styles.textstyle(color: ColorRes.black, fontSize: 20),
    subTitle: message,
    subTitleStyle: isError
        ? Styles.textstyle(color: ColorRes.white, fontSize: 12)
        : Styles.textstyle(color: ColorRes.black, fontSize: 12),
  );
}

String? exceptionHandling(dynamic error, StackTrace stack) {
  debugPrintLocal(stack.toString());
  if (error is FormatException) {
    return "Format Exception Occured";
  } else if (error is IOException) {
    return "class of input-output-related exceptions";
  } else if (error is PlatformException) {
    return "Platform Specific Exceptions";
  } else if (error is TimeoutException) {
    return "TimeOut Exception";
  } else {
    return error.toString();
  }
}

String intToDuration(int seconds) {
  Duration duration = Duration(seconds: seconds);
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}
