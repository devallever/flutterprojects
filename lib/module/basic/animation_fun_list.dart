import 'package:flutter/material.dart';
import 'package:flutterprojects/module/animation/rotate_animation_page.dart';
import 'package:flutterprojects/module/animation/scale_animation_page.dart';
import 'package:flutterprojects/module/animation/slide_animation_page.dart';
import 'package:flutterprojects/module/core/widget/base_fun_list_page.dart';
import 'package:flutterprojects/module/data/item_fun_data.dart';

import '../animation/animation_base_page.dart';
import '../animation/fade_animation_page.dart';

class AnimationFunList extends BaseFunListPage {
  @override
  List<ItemFunData> getData() => [
        ItemFunData(
            title: '动画基础',
            desc: '动画基础',
            itemClick: (context, data) {
              Navigator.push(getBuilderContext(),
                  MaterialPageRoute(builder: (context) => AnimationBasePage()));
            }),
    ItemFunData(
        title: '平移动画 SlideTransition',
        desc: '平移动画',
        itemClick: (context, data) {
          Navigator.push(getBuilderContext(),
              MaterialPageRoute(builder: (context) => SlideAnimationPage()));
        }),
    ItemFunData(
        title: '旋转动画 RotationTransition',
        desc: '旋转动画',
        itemClick: (context, data) {
          Navigator.push(getBuilderContext(),
              MaterialPageRoute(builder: (context) => RotateAnimationPage()));
        }),
    ItemFunData(
        title: '缩放动画 ScaleTransition',
        desc: '缩放动画',
        itemClick: (context, data) {
          Navigator.push(getBuilderContext(),
              MaterialPageRoute(builder: (context) => ScaleAnimationPage()));
        }),
    ItemFunData(
        title: '渐变动画 FadeTransition',
        desc: '渐变动画',
        itemClick: (context, data) {
          Navigator.push(getBuilderContext(),
              MaterialPageRoute(builder: (context) => FadeAnimationPage()));
        })
      ];

  @override
  String getTitle() => '动画';
}
