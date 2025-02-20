import 'package:flutter/material.dart';
import 'package:flutterprojects/module/basic/label_text_view.dart';
import 'package:flutterprojects/mvvm/login/model/data/user.dart';
import 'package:flutterprojects/mvvm/login/vm/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  @override
  void dispose() {
    //貌似没效果
    Provider.of<LoginViewModel>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            labelTextView('账号：'),
            TextField(controller: usernameController),
            labelTextView('密码'),
            TextField(
              controller: pwdController,
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  final username = usernameController.text;
                  final pwd = pwdController.text;
                  // toast('登录: $username}, $pwd');
                  loginViewModel.login(User(username: username, password: pwd));
                },
                child: Text('登录')),
            labelTextView(loginViewModel.loginState)
          ],
        ),
      ),
    );
  }
}
