import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';

class RotateAnimationPage extends BaseTitlePage {
  @override
  Widget getPageContent() => RotateAnimationPageContent();

  @override
  String getTitle() => '旋转动画';
}

class RotateAnimationPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RotateAnimationPageState();
}

class RotateAnimationPageState extends State<RotateAnimationPageContent>
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
    animation = Tween(begin: 0.0, end: 0.5).animate(animationController);
    return Container(
        child: RotationTransition(
            turns: animation,
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
