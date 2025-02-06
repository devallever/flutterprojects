
import 'package:flutter/material.dart';
import 'package:flutterprojects/module/core/widget/base_fun_list_page.dart';
import 'package:flutterprojects/module/data/item_fun_data.dart';
import 'module/basic/basic_fun_list.dart';

void main() {
  runApp(MyApp());
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
    return funList;
  }

  @override
  String getTitle() {
    return 'Flutter Projects';
  }
}
