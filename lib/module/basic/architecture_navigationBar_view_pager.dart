import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArchitectureNavigationBarPageView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ArchitectureNavigationBarPageViewState();
}

class ArchitectureNavigationBarPageViewState extends State<ArchitectureNavigationBarPageView> {

  var _currentNavigationBarIndex = 0;
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {

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
        label: 'Item${i+1}',
      ));
    }

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('ArchitectureNavigationBarPageView'),
        ),
        //ListView
        body: Column(
          children: [
            Expanded(child: PageView(
              controller: _pageController,
              onPageChanged: (index){
                setState(() {
                  _currentNavigationBarIndex = index;
                });
              },
              children: [
                Text('Page1'),
                Text('Page2'),
                Text('Page3'),
                Text('Page4'),
              ],
            )),
            BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  _currentNavigationBarIndex = index;
                  _pageController.jumpToPage(index);
                });
              },
              currentIndex: _currentNavigationBarIndex,
              items: navigationBarItems,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black26,
              type: BottomNavigationBarType.fixed,
            )
          ],
        ),
      ),
    );
  }

}