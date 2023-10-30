import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(GetMaterialApp(home: const SignUpSuccess()));
}

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({super.key});
  static const String route = '/signsuccess';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double imageWidth = width * 0.6;
    double imageHeight = height * 0.6;

    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/login/signupsuccess.svg',
              height: imageHeight,
              width: imageWidth,
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(ViewRoute.mainPage);
              },
              child: Text('프로필 작성하기', style: AppTypograpy.button36Regular),
              style: AppButton.xLarge,
            )
          ],
        ),
      )),
    );
  }
}
