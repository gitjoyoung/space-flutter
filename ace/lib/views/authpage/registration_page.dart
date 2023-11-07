// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ace/controller/signup_controller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/email_validator.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/views/authpage/login.dart';
import 'package:ace/widgets/text_filed_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(SignUpController());
  Get.lazyPut(() => SignUpController());

  runApp(
    GetMaterialApp(
      home: RegistrationView(),
      getPages: [
        GetPage(
            name: ViewRoute.registrationPage, page: () => RegistrationView()),
        GetPage(name: ViewRoute.loginPage, page: () => const LoginView()),
      ],
    ),
  );
}

class RegistrationView extends GetView<SignUpController> {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: AppBar(
            iconTheme: IconThemeData(
              color: AppColors.neutral80,
              size: 20,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('회원가입 하기',
                style: AppTypograpy.tapButtonBold18
                    .copyWith(color: AppColors.neutral80)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                '*표시는 필수입력항목 입니다.',
                style: AppTypograpy.cardBody
                    .copyWith(color: AppColors.systemWarnin),
                textAlign: TextAlign.right,
              ),
            ),
            Row(
              children: [
                Text(
                  '이름',
                  style: AppTypograpy.tapButtonNavgation16
                      .copyWith(color: AppColors.neutral80),
                ),
                SizedBox(width: 4),
                Text(
                  '*',
                  style: TextStyle(color: AppColors.systemWarnin, fontSize: 30),
                ),
              ],
            ),
            Container(
              height: 66,
              child: TextFieldCustom(
                  validator: controller.validateKoreanName,
                  hintText: '이름을 입력해 주세요',
                  controller: controller.name),
            ),
            Row(
              children: [
                Text(
                  '이메일',
                  style: AppTypograpy.tapButtonNavgation16
                      .copyWith(color: AppColors.neutral80),
                ),
                SizedBox(width: 4),
                Text(
                  '*',
                  style: TextStyle(color: AppColors.systemWarnin, fontSize: 30),
                ),
              ],
            ),
            Container(
              height: 66,
              child: TextFieldCustom(
                  validator: EmailValidator.isValid,
                  hintText: '이메일 주소를 입력해주세요.',
                  errorText: '이메일 주소가 틀립니다. 다시 한번 입력해주세요.',
                  controller: controller.email),
            ),
            Row(
              children: [
                Text(
                  '비밀번호',
                  style: AppTypograpy.tapButtonNavgation16
                      .copyWith(color: AppColors.neutral80),
                ),
                SizedBox(width: 4),
                Text(
                  '*',
                  style: TextStyle(color: AppColors.systemWarnin, fontSize: 30),
                ),
              ],
            ),
            Container(
              height: 66,
              child: TextFieldCustom(
                  validator: (value) {
                    if (value.length > 8) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  hintText: '비밀번호를 입력해주세요.',
                  password: true,
                  controller: controller.password),
            ),
            Row(
              children: [
                Text(
                  '휴대전화',
                  style: AppTypograpy.tapButtonNavgation16
                      .copyWith(color: AppColors.neutral80),
                ),
                SizedBox(width: 4),
                Text(
                  '*',
                  style: TextStyle(color: AppColors.systemWarnin, fontSize: 30),
                ),
              ],
            ),
            Container(
              height: 66,
              child: TextFieldCustom(
                  hintText: '휴대폰 번호를 입력해주세요', controller: controller.phone),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.isLoading.value
                  ? null
                  : () async {
                      print('회원가입 버튼 클릭됨');
                      await controller.signup();
                      if (!controller.isLoading.value) {
                        if (controller.token.value.isNotEmpty) {
                          print('회원가입성공으로 이동');
                          Get.toNamed(ViewRoute.signupSuccess);
                        } else {
                          print('회원가입 실패');
                        }
                      }
                    },
              child: Obx(() => Text(
                    controller.isLoading.value ? '회원가입하기' : '회원가입',
                    style: AppTypograpy.tapButtonMedium18,
                  )),
              style: AppButton.xLarge,
            )
          ],
        ),
      ),
    );
  }
}
