import 'package:flutter/material.dart';
import 'package:flutterprojects/module/basic/label_text_view.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';

class PageDataDetailPage extends StatefulWidget {
  final String content;

  PageDataDetailPage(this.content, {super.key});

  @override
  State<StatefulWidget> createState() =>
      PageDataDetailPageState(content: content);

// @override
// Widget getPageContent() {
//   return PageDataDetailPageContent();
// }
//
// @override
// String getTitle() => '页面详情: 参数->$content';
}

// class PageDataDetailPageContent extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => PageDataDetailPageState();
// }

class PageDataDetailPageState extends State<PageDataDetailPage> {
  final String content;

  PageDataDetailPageState({required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("页面详情: 参数->$content"),
      ),
      body: Center(
          child: Column(children: [
        labelTextView('回传页面数据'),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, "reBack data");
            },
            child: Text('关闭页面')),
      ])),
    );
  }
}
