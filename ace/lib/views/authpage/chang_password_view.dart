// ignore_for_file: prefer_const_constructors

import 'package:ace/controller/change_password_controller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/views/authpage/login.dart';
import 'package:ace/widgets/text_filed_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ChangePasswordController());

  runApp(GetMaterialApp(home: ChangePasswordView(), getPages: [
    GetPage(
        name: ViewRoute.changePasswordPage,
        page: () => const ChangePasswordView()),
    GetPage(name: ViewRoute.loginPage, page: () => const LoginView()),
  ]));
}

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: SizedBox(
            width: 83,
            height: 13,
            child: SvgPicture.asset(
              'assets/login/spacelogo.svg',
              fit: BoxFit.fitWidth,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(
                height: 0.5, thickness: 0.3, color: AppColors.neutral30),
          ),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.neutral80,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Expanded(
                    child: Text(
                      '비밀번호 변경',
                      textAlign: TextAlign.center,
                      style: AppTypograpy.tapButtonBold18
                          .copyWith(color: AppColors.neutral80),
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  '현재 비밀번호',
                  style: AppTypograpy.tapButtonNavgation16
                      .copyWith(color: AppColors.neutral80),
                ),
              ],
            ),
          ),
          Container(
            height: 66,
            child: TextFieldCustom(
                hintText: '비밀번호',
                password: true,
                controller: controller.currentPassword),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  '새 비밀번호',
                  style: AppTypograpy.tapButtonNavgation16
                      .copyWith(color: AppColors.neutral80),
                ),
              ],
            ),
          ),
          Container(
            height: 66,
            child: TextFieldCustom(
                hintText: '비밀번호',
                password: true,
                controller: controller.newPassword),
          ),
          SizedBox(height: 313),
          ElevatedButton(
            onPressed: controller.isLoading.value
                ? null
                : () async {
                    var currentPass = controller.currentPassword.text;
                    var newPass = controller.newPassword.text;

                    // 비밀번호 변경을 시도합니다.
                    await controller.changePasswordstate(currentPass, newPass);
                    if (controller.isSuccess.value) {
                      Get.offAllNamed(ViewRoute.loginPage);
                    } else {
                      '비밀번호 변경 실패';
                    }
                  },
            child: Text(
              '변경하기',
              style: AppTypograpy.tapButtonMedium18,
            ),
            style: AppButton.xLarge,
          )
        ],
      ),
    );
  }
}
