import 'package:flutter/material.dart';
import 'package:flutterprojects/module/data/item_fun_data.dart';

abstract class BaseFunListPage extends StatefulWidget {
  List<ItemFunData> data = [];

  BaseFunListPage({super.key});

  @override
  State<BaseFunListPage> createState() =>
      _BaseFunListPageState(getTitle(), getData());

  String getTitle();

  List<ItemFunData> getData();
}

class _BaseFunListPageState extends State<BaseFunListPage> {
  List<ItemFunData> data = [];
  String title;

  _BaseFunListPageState(this.title, this.data);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        //ListView
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _itemView(data[index]);
          },
        ),
      ),
    );
  }

  Widget _itemView(ItemFunData data) {
    return GestureDetector(
      // 设置空白区域可点击
      behavior: HitTestBehavior.translucent,
      //点击事件
      onTap: () {
        data.itemClick.call(data);
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
