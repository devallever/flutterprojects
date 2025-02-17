import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';

class FadeAnimationPage extends BaseTitlePage {
  @override
  Widget getPageContent() => FadeAnimationPageContent();

  @override
  String getTitle() => '渐变动画';
}

class FadeAnimationPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FadeAnimationPageState();
}

class FadeAnimationPageState extends State<FadeAnimationPageContent>
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
    animation = Tween(begin: 0.25, end: 1.0).animate(animationController);
    return Container(
        child: FadeTransition(
            opacity: animation,
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
