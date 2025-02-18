import 'package:flutter/material.dart';
import 'package:flutterprojects/module/basic/label_text_view.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProviderPageState();
}

class ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider状态管理'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            labelTextView('${counterProvider._count}'),
            ElevatedButton(onPressed: () {
              counterProvider.increase();
            }, child: Text("点击加1")),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {
              counterProvider.decrease();
            }, child: Text("点击减1")),
          ],
        ),
      ),
    );
  }
}

class CounterState with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increase() {
    _count++;
    notifyListeners();
  }

  void decrease() {
    _count--;
    notifyListeners();
  }
}
