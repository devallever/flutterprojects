import 'package:flutter/material.dart';
import 'package:flutterprojects/module/core/util.dart';
import 'package:flutterprojects/module/data/item_fun_data.dart';

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
    funList.add(ItemFunData(title: "Flutter Basic", desc: "Flutter 基础"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
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
      behavior: HitTestBehavior.translucent, // 设置空白区域可点击
      onTap: () {
        log(data.title);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black),
            ),
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
