import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojects/module/core/util.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';

class SlideAnimationPage extends BaseTitlePage {
  @override
  Widget getPageContent() => SlideAnimationPageContent();

  @override
  String getTitle() => '平移动画';
}

class SlideAnimationPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlideAnimationPageState();
}

class SlideAnimationPageState extends State<SlideAnimationPageContent>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> animation;
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
    animation = Tween(
            begin: Offset.zero,
            end: Offset((getScreenWidth(context) - 100) / 100, 1))
        .animate(animationController);
    return Container(
        child: SlideTransition(
            position: animation,
            child: Image(
              image: AssetImage('lib/assets/default_image.jpg'),
              width: 100,
              height: 100,
            )));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
