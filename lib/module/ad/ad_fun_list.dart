import 'package:flutter/material.dart';
import 'package:flutterprojects/module/ad/internal_ad_page.dart';
import 'package:flutterprojects/module/core/widget/base_fun_list_page.dart';
import 'package:flutterprojects/module/data/item_fun_data.dart';


class AdFunList extends BaseFunListPage {
  @override
  List<ItemFunData> getData() {
    return [
      ItemFunData(
          title: 'Flutter-Admob-内置广告',
          desc: '横幅，插页，激励视频',
          itemClick: (context, data) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => InternalAdPage()));
          }),
      ItemFunData(
          title: 'Flutter-Admob-原生广告',
          desc: '原生广告，Banner广告，大图广告，信息流广告',
          itemClick: (context, data) {})
    ];
  }

  @override
  String getTitle() => 'Flutter-AdMob';
}
