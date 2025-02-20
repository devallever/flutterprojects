

import 'package:flutter/widgets.dart';
import 'package:flutterprojects/mvvm/login/model/data/user.dart';

class LoginViewModel with ChangeNotifier {

  String loginState = "未登录";

  Future<void> login(User user) async {
    loginState = '登录中';
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    loginState = '登录成功';
    notifyListeners();
  }
}
