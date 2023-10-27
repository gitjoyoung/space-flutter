import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(home: const LoginView()));
}

class LoginView extends GetView {
  const LoginView({super.key});
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // 원하는 모서리 둥근 정도를 설정
                ),
              ),
            ),
            TextField(decoration: InputDecoration(fillColor: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("비밀번호 찾기"),
                Text(" | "),
                Text("회원가입하기"),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: Text('로그인'))
          ]),
    );
  }
}
