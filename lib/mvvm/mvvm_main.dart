import 'package:flutter/material.dart';
import 'package:flutterprojects/module/core/widget/base_fun_list_page.dart';
import 'package:flutterprojects/module/data/item_fun_data.dart';
import 'package:flutterprojects/mvvm/login/ui/login_screen.dart';

class MvvmMain extends BaseFunListPage {
  @override
  List<ItemFunData> getData() => [
        ItemFunData(
            title: '登录模块',
            desc: 'Mvvm登录模块',
            itemClick: (context, data) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            })
      ];

  @override
  String getTitle() => 'Mvvm架构';
}
