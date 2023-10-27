import 'package:ace/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplachPage extends StatelessWidget {
  const SplachPage({super.key});

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
            onPressed: () {},
            child: Text('시작하기'),
            style: AppButton.xLarge,
          )
        ],
      )),
    );
  }
}
