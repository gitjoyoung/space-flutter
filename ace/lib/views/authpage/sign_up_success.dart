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
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/login/signupsuccess.svg',
              height: 500,
              width: 500,
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {},
              child: Text('프로필 작성하기', style: AppTypograpy.button36Regular),
              style: AppButton.xLarge,
            )
          ],
        ),
      )),
    );
  }
}
