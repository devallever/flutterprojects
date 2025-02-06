import 'package:flutter/cupertino.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';

class BasicWidgetPage extends BaseTitlePage{
  @override
  Widget getPageContent() {
    return Text("基础控件");
  }

  @override
  String getTitle() {
    return 'BasicWidgetPage';
  }

}