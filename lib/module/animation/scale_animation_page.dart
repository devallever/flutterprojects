import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';

class ScaleAnimationPage extends BaseTitlePage {
  @override
  Widget getPageContent() => ScaleAnimationPageContent();

  @override
  String getTitle() => '缩放动画';
}

class ScaleAnimationPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScaleAnimationPageState();
}

class ScaleAnimationPageState extends State<ScaleAnimationPageContent>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 2000), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animationController.forward();
            }
          });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    animation = Tween(begin: 0.5, end: 1.0).animate(animationController);
    return Container(
        child: ScaleTransition(
            scale: animation,
            child: Center(
              child: Image(
                image: AssetImage('lib/assets/default_image.jpg'),
                width: 100,
                height: 100,
              ),
            )));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
