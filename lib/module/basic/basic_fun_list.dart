import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojects/module/basic/basic_widget_page.dart';
import 'package:flutterprojects/module/basic/list_widget_page.dart';
import 'package:flutterprojects/module/core/widget/base_fun_list_page.dart';
import 'package:flutterprojects/module/data/item_fun_data.dart';

import 'grid_widget_page.dart';

class BasicFunList2 extends BaseFunListPage {
  @override
  String getTitle() {
    return "Flutter Basic";
  }

  @override
  List<ItemFunData> getData() {
    List<ItemFunData> list = [];
    list.add(ItemFunData(
        title: "基础控件",
        desc: "基础控件基本用法",
        itemClick: (context, data) => {
              Navigator.push(getBuilderContext(),
                  MaterialPageRoute(builder: (context) => BasicWidgetPage()))
            }));
    list.add(ItemFunData(
        title: "高级控件-列表",
        desc: "高级控件基本用法，列表",
        itemClick: (context, data) => {
          Navigator.push(getBuilderContext(),
              MaterialPageRoute(builder: (context) => ListWidgetPage()))
        }));
    list.add(ItemFunData(
        title: "高级控件-网格",
        desc: "高级控件基本用法，网格",
        itemClick: (context, data) => {
          Navigator.push(getBuilderContext(),
              MaterialPageRoute(builder: (context) => GridWidgetPage()))
        }));
    list.add(ItemFunData(
        title: "高级控件-ViewPager",
        desc: "高级控件基本用法，分页",
        itemClick: (context, data) => {}));
    return list;
  }
}
