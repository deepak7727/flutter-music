import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/styles/color_list.dart';
import 'package:flutter_application_1/styles/styles.dart';

void debugPrintLocal(String msg) {
  if (kDebugMode) {
    print(msg);
  }
}

void showToast({required String title, String? message, bool isError = false}) {
  BotToast.showSimpleNotification(
    backgroundColor: isError ? ColorList.danger : ColorList.white,
    title: title,
    titleStyle: isError
        ? Styles.textstyle(color: ColorList.white, fontSize: 20)
        : Styles.textstyle(color: ColorList.black, fontSize: 20),
    subTitle: message,
    subTitleStyle: isError
        ? Styles.textstyle(color: ColorList.white, fontSize: 12)
        : Styles.textstyle(color: ColorList.black, fontSize: 12),
  );
}
