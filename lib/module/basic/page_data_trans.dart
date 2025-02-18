import 'package:flutter/material.dart';
import 'package:flutterprojects/module/basic/label_text_view.dart';
import 'package:flutterprojects/module/basic/page_data_detail.dart';
import 'package:flutterprojects/module/core/toast.dart';

class PageDataTransPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageDataTransPageState();
// @override
// Widget getPageContent() => PageDataTransPageContent();
//
// @override
// String getTitle() => '传递页面数据和回传页面数据';
}

class PageDataTransPageState extends State<PageDataTransPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("传递页面数据和回传页面数据"),
      ),
      body: Center(
          child: Column(children: [
            labelTextView('在构造方法中传递数据'),
            ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageDataDetailPage("Hello")));
                  toast("receive data $result");
                },
                child: Text('打开页面')),
          ])),
    );
    return Center(
        child: Column(children: [
          labelTextView('在构造方法中传递数据'),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageDataDetailPage("Hello")));
              },
              child: Text('打开页面')),
        ]));
  }
}
