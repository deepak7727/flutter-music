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

Future<void> showToast({
  required String title,
  String? message,
  bool success = false,
  bool isError = false,
}) async {
  BotToast.showSimpleNotification(
    backgroundColor: isError
        ? ColorRes.danger
        : success
            ? ColorRes.success
            : ColorRes.black,
    title: title,
    titleStyle: isError
        ? Styles.textStyle(color: ColorRes.white, fontSize: 20)
        : success
            ? Styles.textStyle(color: ColorRes.white, fontSize: 20)
            : Styles.textStyle(color: ColorRes.black, fontSize: 20),
    subTitle: message,
    subTitleStyle: isError
        ? Styles.textStyle(color: ColorRes.white, fontSize: 12)
        : success
            ? Styles.textStyle(color: ColorRes.white, fontSize: 12)
            : Styles.textStyle(color: ColorRes.black, fontSize: 12),
  );
}

Future<void> showBotMessage({
  required String title,
}) async {
  BotToast.showText(
    text: title,
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
  } else if (error is SocketException) {
    return "Socket Exception";
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

Future<bool> checkNetwork() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      return true;
    }
  } on SocketException catch (_) {
    print('not connected');
  }
  return false;
}
