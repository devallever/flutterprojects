import 'package:flutter/material.dart';
import 'package:flutterprojects/module/basic/label_text_view.dart';
import 'package:flutterprojects/module/core/util.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';

class AnimationBasePage extends BaseTitlePage {
  @override
  Widget getPageContent() => AnimationBasePageContent();

  @override
  String getTitle() => '动画基础';
}

class AnimationBasePageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimationBasePageState();
}

class AnimationBasePageState extends State<AnimationBasePageContent>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation1;
  late AnimationController animationController1;
  // late AnimationController animationController2;

  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();
    animationController1 =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation1 = Tween<double>(begin: 0, end: 200).animate(animationController1)
      ..addListener(() {
        setState(() {});
      })
    ..addStatusListener((state){
      log("animation state ${animation1.status}");
      if(state == AnimationStatus.completed) {
        animationController1.reverse();
      } else if (state == AnimationStatus.dismissed) {
        animationController1.forward();
      }
    });
    // animationController2 =
    //     AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation2 = Tween<double>(begin: 0, end: 200).animate(animationController1);
  }

  @override
  void dispose() {
    super.dispose();
    animationController1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(children: [_animation1(), _animation2()]));
  }

  Widget _animation1() {
    return Column(children: [
      labelTextView("放大动画 Animation + AnimationController + Tween"),
      Image(
        image: AssetImage('lib/assets/default_image.jpg'),
        width: animation1.value,
        height: animation1.value,
      ),
      ElevatedButton(
          onPressed: () {
            if (animationController1.isAnimating) {
              animationController1.stop();
            }
            animationController1.forward();
          },
          child: Text('开始动画'))
    ]);
  }

  Widget _animation2() {
    return Column(children: [
      labelTextView("放大动画 AnimateWidget"),
      AnimatedImage(animation: animation2),
      ElevatedButton(
          onPressed: () {
            if (animationController1.isAnimating) {
              animationController1.stop();
            }
            animationController1.forward();
          },
          child: Text('开始动画2'))
    ]);
  }
}

class AnimatedImage extends AnimatedWidget {
  const AnimatedImage({super.key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Image(
      image: AssetImage('lib/assets/default_image.jpg'),
      width: animation.value,
      height: animation.value,
    );
  }
}
