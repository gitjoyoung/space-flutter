import 'package:ace/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const String route = '/splash';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double imageWidth = width * 0.6;
    double imageHeight = height * 0.6;

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/login/splash.svg',
            width: imageWidth,
            height: imageHeight,
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
