import 'package:flutter/material.dart';
import 'package:flutterprojects/module/core/widget/base_fun_list_page.dart';
import 'package:flutterprojects/module/data/item_fun_data.dart';
import 'package:flutterprojects/module/platform/method_channel_page.dart';

import 'android_view_page.dart';

class PlatformFunList extends BaseFunListPage {
  @override
  List<ItemFunData> getData() => [
        ItemFunData(
            title: 'MethodChannel',
            desc: '使用MethodChannel调用平台代码',
            itemClick: (context, data) {
              Navigator.push(getBuilderContext(),
                  MaterialPageRoute(builder: (context) => MethodChannelPage()));
            }),
        ItemFunData(
            title: 'AndroidView',
            desc: '加载原生控件',
            itemClick: (context, data) {
              Navigator.push(getBuilderContext(),
                  MaterialPageRoute(builder: (context) => AndroidViewPage()));
            })
      ];

  @override
  String getTitle() => 'Flutter与平台交互';
}
