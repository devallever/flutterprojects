import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterprojects/module/basic/label_text_view.dart';
import 'package:flutterprojects/module/core/util.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';

class AndroidViewPage extends BaseTitlePage {
  @override
  Widget getPageContent() => AndroidViewPageContent();

  @override
  String getTitle() => 'AndroidView';
}

class AndroidViewPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AndroidViewPageState();
}

class AndroidViewPageState extends State<AndroidViewPageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      labelTextView('AndroidView 加载原生控件'),
      SizedBox(
          height: 48, child: AndroidView(viewType: 'viewTypeCodeTextView')),
      SizedBox(height: 48, child: AndroidView(viewType: 'viewTypeLayoutTextView'))
    ]));
  }
}
