import 'package:flutter/material.dart';
import 'package:flutterprojects/module/basic/label_text_view.dart';
import 'package:flutterprojects/module/core/toast.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';

class GridWidgetPage extends BaseTitlePage {
  @override
  Widget getPageContent() {
    return GridWidgetPageContent();
  }

  @override
  String getTitle() {
    return "GridWidgetPage";
  }
}

class GridWidgetPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridWidgetPageState();
  }
}

class GridWidgetPageState extends State<GridWidgetPageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [verticalGrid()]),
    );
  }

  Widget verticalGrid() {
    final List<UserItem> userList = [];
    for (int i = 0; i < 10; i++) {
      userList.add(UserItem(
          id: i, name: "Username$i", avatar: 'lib/assets/default_image.jpg'));
    }
    return Column(children: [
      labelTextView('垂直网格 GridView'),
      SizedBox(
        height: 246, //column 嵌套 gridview 必须设置height????
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 2.4//根据需要慢慢调
            ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(item.avatar),
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(item.name)
                    ],
                  ),
                ),
              );
            }),
      ),
      labelTextView('横向网格 GridView scrollDirection'),
      SizedBox(
        height: 240, //column 嵌套 gridview 必须设置height????
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1//根据需要慢慢调
            ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(item.avatar),
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(item.name)
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
