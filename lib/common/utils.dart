import 'package:flutter/foundation.dart';

class UtilsCLass{
  static void printLog(String printData){
    if(kDebugMode){
      print("Swati Log ==> $printData");
    }
  }

}