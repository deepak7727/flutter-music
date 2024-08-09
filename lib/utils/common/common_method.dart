import 'package:flutter/foundation.dart';

void debugPrint(String msg){
  if(kDebugMode){
    print(msg);
  }
}