import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterprojects/module/basic/label_text_view.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';

class MethodChannelPage extends BaseTitlePage {
  @override
  Widget getPageContent() => MethodChannelPageContent();

  @override
  String getTitle() => "MethodChannel";
}

class MethodChannelPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MethodChannelPageState();
}

class MethodChannelPageState extends State<MethodChannelPageContent> {
  String _appVersionName = "";
  static const platform = MethodChannel('platformChannel/app');
  static const MethodChannel methodChannel = MethodChannel('CHANNEL_CALL_FLUTTER_FROM_ANDROID');
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    methodChannel.setMethodCallHandler(handleMethodCall);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      labelTextView('使用MethodChannel调用平台代码'),
      ElevatedButton(
          onPressed: () {
            _getAppVersion();
          },
          child: Text('获取应用版本')),
      labelTextView('当前应用版本：$_appVersionName'),
      ElevatedButton(
          onPressed: () {
            _startCallFromAndroid();
          },
          child: Text('启动从Android调用Flutter方法')),
      labelTextView('fromAndroidCallFlutter: $_progress')
    ]));
  }

  // 处理来自Android的方法调用
  Future<void> handleMethodCall(MethodCall call) async {
    final methodName = call.method;
    if (methodName == 'onProgress') {
      final result = call.arguments as int;
      setState(() {
        _progress = result;
      });
    }

  }

  void _getAppVersion() async {
    final result = (await platform.invokeMethod<String>('getVersionName'))!;
    setState(() {
      _appVersionName = result;
    });
  }

  void _startCallFromAndroid() {
    platform.invokeMethod<String>('startCallFromAndroid');
  }
}
