import 'package:flutter/widgets.dart';

class ItemFunData {
  String title = "";
  String desc = "";
  void Function(BuildContext context, ItemFunData data) itemClick;

  ItemFunData({
    required this.title ,
    required this.desc,
    required this.itemClick
  });
}
