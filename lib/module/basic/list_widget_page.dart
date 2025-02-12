import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojects/module/basic/label_text_view.dart';
import 'package:flutterprojects/module/core/toast.dart';
import 'package:flutterprojects/module/core/util.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';

class ListWidgetPage extends BaseTitlePage {
  @override
  Widget getPageContent() {
    return ListWidgetPageContent();
  }

  @override
  String getTitle() {
    return "ListWidgetPage";
  }
}

class ListWidgetPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListWidgetPageState();
  }
}

class ListWidgetPageState extends State<ListWidgetPageContent> {
  @override
  Widget build(BuildContext context) {
    final List<UserItem> userList = [];
    for (int i = 0; i < 10; i++) {
      userList.add(UserItem(
          id: i, name: "Username$i", avatar: 'lib/assets/default_image.jpg'));
    }

    return Center(
      child: Column(children: [verticalList()]),
    );
  }

  Widget verticalList() {
    final List<UserItem> userList = [];
    for (int i = 0; i < 3; i++) {
      userList.add(UserItem(
          id: i, name: "Username$i", avatar: 'lib/assets/default_image.jpg'));
    }
    return Column(children: [
      labelTextView('垂直列表 ListView'),
      SizedBox(
        height: 246, //column 嵌套 listview 必须设置height????
        child: ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              final item = userList[index];
              return InkWell(
                  onTap: () {
                    toast(item.name);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(item.avatar),
                          width: 72,
                          height: 72,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.id.toString()),
                              Text(item.name)
                            ])
                      ],
                    ),
                  ));
            }),
      ),
      labelTextView('横向列表 ListView scrollDirection'),
      SizedBox(
        height: 92,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: userList.length,
            itemBuilder: (context, index) {
              final item = userList[index];
              return InkWell(
                borderRadius: BorderRadius.circular(0),
                onTap: () {
                  toast(item.name);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage(item.avatar),
                        width: 72,
                        height: 72,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(item.id.toString()), Text(item.name)])
                    ],
                  ),
                ),
              );
            }),
      ),
    ]);
  }
}

class UserItem {
  int id;
  String name;
  String avatar;

  UserItem({required this.id, required this.name, required this.avatar});
}
