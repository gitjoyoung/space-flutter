import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const String route = '/splashPage';
  static const String loginPage = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/login/splash.svg',
            // height: sizeConfig.imageHeight,
            // width: sizeConfig.imageWidth,
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(ViewRoute.loginPage);
            },
            child: Text('시작하기'),
            style: AppButton.xLarge,
          )
        ],
      )),
    );
  }
}