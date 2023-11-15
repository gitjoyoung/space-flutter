// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ace/controller/auth/auth_controller.dart';
import 'package:ace/controller/auth/signup_controller.dart';
import 'package:ace/routes/pages.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/email_validator.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/views/authpage/login.dart';
import 'package:ace/views/authpage/sign_up_success.dart';
import 'package:ace/widgets/common/text_filed_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegistrationView extends GetView<SignUpController> {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(SignUpController());
    // Get.put(AuthController());
    Get.lazyPut(() => SignUpController());

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
                style: AppTypography.tapButtonBold18
                    .copyWith(color: AppColors.neutral80)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  '*표시는 필수입력항목 입니다.',
                  style: AppTypography.cardBody
                      .copyWith(color: AppColors.systemWarnin),
                  textAlign: TextAlign.right,
                ),
              ),
              Row(
                children: [
                  Text(
                    '이름',
                    style: AppTypography.tapButtonNavgation16
                        .copyWith(color: AppColors.neutral80),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '*',
                    style:
                        TextStyle(color: AppColors.systemWarnin, fontSize: 30),
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
                    style: AppTypography.tapButtonNavgation16
                        .copyWith(color: AppColors.neutral80),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '*',
                    style:
                        TextStyle(color: AppColors.systemWarnin, fontSize: 30),
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
                    style: AppTypography.tapButtonNavgation16
                        .copyWith(color: AppColors.neutral80),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '*',
                    style:
                        TextStyle(color: AppColors.systemWarnin, fontSize: 30),
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
                    style: AppTypography.tapButtonNavgation16
                        .copyWith(color: AppColors.neutral80),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '*',
                    style:
                        TextStyle(color: AppColors.systemWarnin, fontSize: 30),
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

                        // 회원가입 성공 후의 처리는 signup() 함수 내에서 이루어지므로,
                        // 여기서는 추가적인 처리가 필요하지 않습니다.
                        // 성공, 실패, 에러 등의 처리는 모두 signup() 함수 내에서 처리됩니다.
                      },
                child: Obx(() => Text(
                      controller.isLoading.value ? '회원가입하기' : '회원가입',
                      style: AppTypography.tapButtonMedium18,
                    )),
                style: AppButton.xLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
