import 'package:flutter/material.dart';
import 'package:flutterprojects/module/data/item_fun_data.dart';

import 'base_title_page.dart';

abstract class BaseFunListPage extends BaseTitlePage {
  List<ItemFunData> data = [];

  BaseFunListPage({super.key});

  List<ItemFunData> getData();

  @override
  Widget getPageContent() {
    data = getData();
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _itemView(context, data[index]);
      },
    );
  }

  Widget _itemView(BuildContext context, ItemFunData data) {
    return InkWell(
      //点击事件
      onTap: () {
        data.itemClick.call(context, data);
      },
      child: Container(
        //设置内边距
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          //让内容左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              //设置字体格式
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black),
            ),
            //占位，相当于设置外边距
            SizedBox(height: 0),
            Text(
              data.desc,
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black38),
            )
          ],
        ),
      ),
    );
  }
}
