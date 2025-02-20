

import 'package:flutter/widgets.dart';
import 'package:flutterprojects/mvvm/login/model/data/user.dart';

class LoginViewModel with ChangeNotifier {

  Future<bool> login(User user) async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
}
