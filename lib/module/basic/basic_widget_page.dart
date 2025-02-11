import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterprojects/module/core/toast.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';

class BasicWidgetPage extends BaseTitlePage {
  BasicWidgetPage({super.key});

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
  final _textController = TextEditingController();
  var cbSelect = false;
  final List<CbItem> cbItemList = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center, 无效
          children: [
            _LayoutWidget(),
            _TextWidget(),
            _ImageWidget(),
            _ButtonWidget(),
            _InputExitWidget(),
            _CheckBoxWidget(),
            _RadioWidget(),
            _SwitchWidget(),
            _SliderWidget(),
            _CardStyleWidget(),
            _Dialog(),
            _ProgressWidget(),
            _AppBarWidget(),
            _NavigationBarWidget(),
          ],
        ),
      ),
    );
  }

  Widget _LayoutWidget() {
    return Column(children: [
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
    ]);
  }

  Widget _TextWidget() {
    return Column(children: [
      _labelTextView('文本 Text'),
      Text('我是Text'),
    ]);
  }

  Widget _ImageWidget() {
    return Column(children: [
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
    ]);
  }

  Widget _ButtonWidget() {
    return Column(children: [
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
    ]);
  }

  Widget _InputExitWidget() {
    return Column(children: [
      _labelTextView('输入框 TextField'),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: TextField(),
      ),
      _labelTextView('输入框样式 TextField'),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // 阴影颜色
                  spreadRadius: 0, // 阴影扩散
                  blurRadius: 10, // 阴影模糊半径
                  offset: const Offset(0, 0), // 阴影偏移量
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black12, width: 1)),
          child: TextField(
            controller: _textController,
            onChanged: (content) {
              log("TextField changed: $content");
            },
            onSubmitted: (content) {
              log("TextField submitted: $content");
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 0), // 控制文本的实际填充区域,
                // label: Text('Label'),
                // labelStyle: TextStyle(),
                hintText: 'This hintText',
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
      ),
      ElevatedButton(
          onPressed: () {
            log("commit text: ${_textController.text}");
          },
          child: Text('submitted'))
    ]);
  }

  /// *
  /// https://api.flutter.dev/flutter/material/CheckboxListTile-class.html
  Widget _CheckBoxWidget() {
    final List<Widget> listWidget = [];
    final List<Widget> customCBWidget = [];
    if (cbItemList.isEmpty) {
      for (int i = 0; i < 3; i++) {
        cbItemList.add(CbItem(title: "Item${i + 1}", select: false));
      }
    }

    for (int i = 0; i < 3; i++) {
      listWidget.add(CheckboxListTile(
          title: Text(cbItemList[i].title),
          value: cbItemList[i].select, // 检查是否选中
          onChanged: (bool? value) {
            setState(() {
              cbItemList[i].select = !cbItemList[i].select;
            });
          },
          controlAffinity: ListTileControlAffinity.values.first));

      //问题是默认的复选框还在啊??/
      customCBWidget.add(CheckboxListTile(
        value: cbItemList[i].select, // 检查是否选中
        onChanged: (bool? value) {
          setState(() {
            cbItemList[i].select = !cbItemList[i].select;
          });
        },
        title: Row(
          children: [
            Checkbox(
                value: cbItemList[i].select,
                onChanged: (checked) {
                  setState(() {
                    cbItemList[i].select = !cbItemList[i].select;
                  });
                }),
            Text(cbItemList[i].title)
          ],
        ),
      ));
    }

    return Column(
      children: [
        _labelTextView('选中框 Checkbox'),
        Checkbox(
            value: cbSelect,
            onChanged: (value) {
              setState(() {
                cbSelect = !cbSelect;
              });
            }),
        _labelTextView('多选 CheckboxListTile'),
        Column(children: listWidget),
        _labelTextView('多选 自定义CheckboxListTile'),
        Column(children: customCBWidget)
      ],
    );
  }

  var rbSelect = 'OSK';
  final List<String> rbGroupList = [];
  var selectRadioValue = '';

  Widget _RadioWidget() {
    if (rbGroupList.isEmpty) {
      rbGroupList.add('Item1');
      rbGroupList.add('Item2');
      rbGroupList.add('Item3');
    }
    final List<Widget> listRadioListTitle = [];
    for (int i = 0; i < 3; i++) {
      final titleValue = rbGroupList[i];
      listRadioListTitle.add(RadioListTile(
          title: Text(titleValue),
          value: titleValue,
          groupValue: selectRadioValue,
          onChanged: (value) {
            setState(() {
              selectRadioValue = value!;
            });
          }));
    }
    return Column(
      children: [
        _labelTextView('单选 Radio'),
        Radio(
            value: 'OKK',
            groupValue: rbSelect,
            onChanged: (value) {
              setState(() {
                rbSelect = 'OK';
              });
            }),
        _labelTextView('单选 RadioListTile'),
        Column(
          children: listRadioListTitle,
        )
      ],
    );
  }

  var _switchValue = false;

  Widget _SwitchWidget() {
    return Column(children: [
      _labelTextView('开关 Switch'),
      Switch(
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          })
    ]);
  }

  var _sliderValue = 0.0;

  Widget _SliderWidget() {
    return Column(children: [
      _labelTextView('拖动 Slider'),
      Slider(
          value: _sliderValue,
          max: 100,
          onChanged: (value) {
            setState(() {
              _sliderValue = value;
            });
          })
    ]);
  }

  Widget _CardStyleWidget() {
    return Column(children: [
      _labelTextView('卡片样式 Container'),
      Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2), // 阴影颜色
                spreadRadius: 0, // 阴影扩散
                blurRadius: 5, // 阴影模糊半径
                offset: const Offset(0, 0), // 阴影偏移量
              ),
            ]),
      )
    ]);
  }

  Widget _Dialog() {
    return Column(children: [
      _labelTextView('弹窗 Container'),
      ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Title'),
                    content: Text('Message'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok'))
                    ],
                  );
                });
          },
          child: Text('showAlertDialog')),
      _labelTextView('弹窗 showModalBottomSheet'),
      ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width, // 屏幕宽度
                    child: Column(children: [
                      Expanded(child: Container()),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'))
                    ]),
                  );
                });
          },
          child: Text('showModalBottomSheet'))
    ]);
  }

  var progressValue = 0.0;

  Widget _ProgressWidget() {
    return Column(children: [
      _labelTextView('水平进度条 LinearProgressIndicator'),
      LinearProgressIndicator(
        value: progressValue,
        minHeight: 10,
        borderRadius: BorderRadius.circular(45),
      ),
      ElevatedButton(
          onPressed: () {
            setState(() {
              progressValue = progressValue + 0.01;
            });
          },
          child: Text('更新进度')),
      _labelTextView('圆形进度条 CircularProgressIndicator'),
      CircularProgressIndicator()
    ]);
  }

  Widget _AppBarWidget() {
    return Column(children: [
      AppBar(
        leading: IconButton(
            onPressed: () {
              toast('back');
            },
            icon: Image(
              image: AssetImage('lib/assets/icon_home_recording_24.png'),
              width: 20,
              height: 20,
            )),
        title: Text('AppBar',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
        actions: [
          IconButton(
              onPressed: () {
                toast('action');
              },
              icon: Image(
                  width: 20,
                  height: 20,
                  image: AssetImage('lib/assets/icon_home_recording_24.png')))
        ],
      )
    ]);
  }

  var _currentNavigationBarIndex = 0;

  Widget _NavigationBarWidget() {
    final List<BottomNavigationBarItem> navigationBarItems = [];
    for (int i = 0; i < 4; i++) {
      navigationBarItems.add(BottomNavigationBarItem(
        icon: Image.asset(
          'lib/assets/icon_home_recording_24.png',
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          'lib/assets/icon_home_recording_24.png',
          width: 24,
          height: 24,
        ),
        label: 'Item$i',
      ));
    }
    return Column(children: [
      _labelTextView('底部导航栏 BottomNavigationBar'),
      BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentNavigationBarIndex = index;
          });
        },
        currentIndex: _currentNavigationBarIndex,
        items: navigationBarItems,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        type: BottomNavigationBarType.fixed,
      )
    ]);
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

class CbItem {
  var title = "";
  var select = false;

  CbItem({required this.title, required this.select});
}
