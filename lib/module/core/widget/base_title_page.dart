import 'package:flutter/material.dart';

abstract class BaseTitlePage extends StatefulWidget {
  _BaseTitlePageState? state;

  BaseTitlePage({super.key}) {
    state = _BaseTitlePageState(getTitle(), getPageContent());
  }

  @override
  State<BaseTitlePage> createState() {
    return state!;
  }

  String getTitle();

  Widget getPageContent();

  BuildContext getBuilderContext() {
    return state!.getBuilderContext();
  }
}

class _BaseTitlePageState extends State<BaseTitlePage> {
  String title;
  Widget content;
  BuildContext? buildContext;
  _BaseTitlePageState(this.title, this.content);

  BuildContext getBuilderContext() {
    return buildContext!;
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        //ListView
        body: content,
      ),
    );
  }
}
