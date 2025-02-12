import 'package:flutter/widgets.dart';

void log(String msg) {
  print(msg);
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width; // 屏幕宽度
}