
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterprojects/module/ad/ad_fun_list.dart';
import 'package:flutterprojects/module/core/widget/base_fun_list_page.dart';
import 'package:flutterprojects/module/data/item_fun_data.dart';
import 'package:flutterprojects/module/platform/platform_fun_list.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'module/basic/basic_fun_list.dart';
import 'module/basic/provider_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());
  runApp(ChangeNotifierProvider(
      create: (_) => CounterState(), child: MyApp()));
}

class MyApp extends BaseFunListPage {
  MyApp({super.key});

  @override
  List<ItemFunData> getData() {
    List<ItemFunData> funList = [];
    funList.add(ItemFunData(
        title: "Flutter Basic",
        desc: "Flutter 基础",
        itemClick: (context, data) => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BasicFunList2()))
            }));
    funList.add(ItemFunData(
        title: "Flutter Ad",
        desc: "Flutter 接入AdMob",
        itemClick: (context, data) => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AdFunList()))
        }));
    funList.add(ItemFunData(
        title: "Flutter与平台交互",
        desc: "Flutter与Android、iOS交互",
        itemClick: (context, data) => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PlatformFunList()))
        }));
    funList.add(ItemFunData(
        title: "MVVM架构",
        desc: "mvvm架构",
        itemClick: (context, data) => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PlatformFunList()))
        }));
    return funList;
  }

  @override
  String getTitle() {
    return 'Flutter Projects';
  }
}
