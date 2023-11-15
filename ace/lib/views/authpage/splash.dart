import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/views/authpage/login.dart';
import 'package:ace/views/authpage/sign_up_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/login/splash.svg',
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(ViewRoute.loginPage);
                  },
                  child: Text('시작하기'),
                  style: AppButton.xLarge,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
