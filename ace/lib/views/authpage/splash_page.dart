import 'package:ace/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const String route = '/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/login/splash.svg',
            height: 200,
            width: 100,
          ),
          ElevatedButton(
            onPressed: () {
              //로그인 페이지 이동
            },
            child: Text('시작하기'),
            style: AppButton.xLarge,
          )
        ],
      )),
    );
  }
}
