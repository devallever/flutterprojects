import 'package:flutter/material.dart';
import 'package:flutterprojects/module/data/item_fun_data.dart';
import 'module/basic/basic_fun_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Projects'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final funList = [];

  @override
  void initState() {
    funList.add(ItemFunData(
        title: "Flutter Basic",
        desc: "Flutter 基础",
        itemClick: (data) => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BasicFunList2()))
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //ListView
      body: ListView.builder(
        itemCount: funList.length,
        itemBuilder: (context, index) {
          return _itemView(funList[index]);
        },
      ),
    );
  }

  Widget _itemView(ItemFunData data) {
    return GestureDetector(
      // 设置空白区域可点击
      behavior: HitTestBehavior.translucent,
      //点击事件
      onTap: () {
        data.itemClick.call(data);
      },
      child: Container(
        //设置内边距
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          //让内容左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              //设置字体格式
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black),
            ),
            //占位，相当于设置外边距
            SizedBox(height: 0),
            Text(
              data.desc,
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black38),
            )
          ],
        ),
      ),
    );
  }
}
