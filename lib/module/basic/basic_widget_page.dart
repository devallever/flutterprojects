import 'package:flutter/material.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';

class BasicWidgetPage extends BaseTitlePage {
  @override
  Widget getPageContent() {
    return BasicWidgetPageContent();
  }

  @override
  String getTitle() {
    return 'BasicWidgetPage';
  }
}

class BasicWidgetPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BasicWidgetPageState();
}

class BasicWidgetPageState extends State<BasicWidgetPageContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center, 无效
          children: [
            _labelTextView('滚动布局 SingleChildScrollView'),
            _labelTextView('垂直布局 Column'),
            Column(
              children: [Text('1'), Text('2'), Text('3')],
            ),
            _labelTextView('水平布局 Row'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('1'),
                Text('2'),
                Text('3'),
              ],
            ),
            _labelTextView('文本 Text'),
            Text('我是Text'),
            _labelTextView('本地图片 Image'),
            Image(
              image: AssetImage('lib/assets/default_image.jpg'),
              width: 150,
              height: 150,
            ),
            _labelTextView('本地图片圆角 ClipRRect + Image'),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0), // 圆角的大小,
              child: Image(
                  image: AssetImage('lib/assets/default_image.jpg'),
                  width: 150,
                  height: 150),
            ),
            _labelTextView('本地图片圆角 Container + Image'),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // 圆角的大小
                  image: DecorationImage(
                      image: AssetImage('lib/assets/default_image.jpg'))),
            ),
            _labelTextView('本地图片圆形 ClipOval + Image'),
            ClipOval(
              child: Image(
                  image: AssetImage('lib/assets/default_image.jpg'),
                  width: 150,
                  height: 150),
            ),
            //
            _labelTextView('本地图片圆形 CircleAvatar + AssetImage'),
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('lib/assets/default_image.jpg'),
            ),
            //
            _labelTextView('网络图片 NetworkImage'),
            Image(
              image: NetworkImage(
                  'https://gips2.baidu.com/it/u=1651586290,17201034&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f600_800'),
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            _labelTextView('按钮 TextButton'),
            TextButton(onPressed: () => {}, child: Text('TextButton')),

            _labelTextView('按钮 OutlinedButton'),
            OutlinedButton(onPressed: () => {}, child: Text('OutlinedButton')),

            _labelTextView('按钮 ElevatedButton'),
            ElevatedButton(onPressed: () => {}, child: Text('ElevatedButton')),

            _labelTextView('图标按钮 Container + ElevatedButton.icon'),
            Container(
              decoration: const BoxDecoration(),
              height: 56,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.yellow),
                  elevation: WidgetStateProperty.all(10),
                ),
                onPressed: () {},
                label: Text(
                  'icon + ElevatedButton',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                iconAlignment: IconAlignment.start,
                icon: Image.asset(
                  "lib/assets/icon_home_recording_24.png",
                  width: 24,
                  height: 24,
                ),
              ),
            ),

            _labelTextView('按钮 ElevatedButton 修改样式'),
            ElevatedButton(
              onPressed: () => {},
              style: ButtonStyle(
                textStyle: WidgetStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                //改不了颜色
                fixedSize: WidgetStateProperty.all<Size>(Size(300, 56)),
                backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                // 背景颜色
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                // 字体颜色
                shape: WidgetStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    // 形状
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
              ),
              child: Text('ElevatedButton'),
            )
          ],
        ),
      ),
    );
  }

  Widget _ImageWidget() {
    return Column(children: []);
  }

  Widget _labelTextView(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}
