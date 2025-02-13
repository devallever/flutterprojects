import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojects/module/basic/label_text_view.dart';
import 'package:flutterprojects/module/core/toast.dart';
import 'package:flutterprojects/module/core/util.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';

class PageWidgetPage extends BaseTitlePage {
  @override
  Widget getPageContent() => PageWidgetPageContent();

  @override
  String getTitle() => "PageWidgetPage";
}

class PageWidgetPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageWidgetPageState();
}

class PageWidgetPageState extends State<PageWidgetPageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(children: [_verticalPageWidget()]));
  }

  Widget _verticalPageWidget() {
    return Column(children: [
      labelTextView('横向Pager PageView'),
      SizedBox(
        width: getScreenWidth(context),
        height: 200,
        child: PageView(
          children: [
            InkWell(
              onTap: () {
                toast("Hello");
              },
              child: Text('Page1'),
            ),
            Text('Page2'),
            Text('Page3')
          ],
        ),
      ),
      labelTextView('垂直Pager PageView'),
      SizedBox(
        width: getScreenWidth(context),
        height: 200,
        child: PageView(
          scrollDirection: Axis.vertical,
          children: [
            InkWell(
              onTap: () {
                toast("Hello");
              },
              child: Text('Page1'),
            ),
            Text('Page2'),
            Text('Page3')
          ],
        ),
      )
    ]);
  }
}
