import 'package:ace/utils/button.dart';
import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(GetMaterialApp(home: const SignUpSuccess()));
}

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/login/signupsuccess.svg',
            fit: BoxFit.contain,
          ),
          SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              '시작하기',
              style: AppTypograpy.button36Regular,
            ),
            style: AppButton.xLarge,
          )
        ],
      )),
    );
  }
}
