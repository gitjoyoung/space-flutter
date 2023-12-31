import 'package:ace/controller/auth/auth_controller.dart';
import 'package:ace/controller/auth/find_password_controller.dart';
import 'package:ace/controller/auth/login_controller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/email_validator.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/views/authpage/find_password.dart';
import 'package:ace/views/authpage/registration.dart';
import 'package:ace/views/homepage/home_layout.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../widgets/common/text_filed_custom.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: const TextStyle(fontFamily: "Pretendard"),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SvgPicture.asset('assets/login/sface.svg'),
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      height: 66,
                      child: TextFieldCustom(
                          validator: EmailValidator.isValid,
                          hintText: '이메일 주소를 입력해주세요.',
                          errorText: '이메일 주소가 틀립니다. 다시 한번 입력해주세요.',
                          controller: controller.email),
                    ),
                    Container(
                      height: 66,
                      child: TextFieldCustom(
                        validator: (value) {
                          if (value.length > 7) {
                            return true;
                          } else {
                            return false;
                          }
                        },
                        hintText: '비밀번호를 입력해주세요.',
                        errorText: '비밀번호가 틀립니다. 다시 한번 입력해주세요.',
                        password: true,
                        controller: controller.password,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: AppTypography.button36Medium
                              .copyWith(color: AppColors.neutral50),
                          // style: const TextStyle(color: AppColors.neutral60),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('비밀번호 찾기 클릭');

                                  Get.toNamed(ViewRoute.findPasswordPage);
                                },
                              text: '비밀번호 찾기',
                            ),
                            const TextSpan(
                              text: '  |  ',
                            ),
                            TextSpan(
                              text: '회원가입하기',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(ViewRoute.registrationPage);

                                  print('회원가입하기 클릭');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    Obx(() {
                      return ElevatedButton(
                        onPressed: controller.isButtonEnabled.value
                            ? () async {
                                await controller.authController.login(
                                    controller.email.text,
                                    controller.password.text);
                                await controller.authController.fetchProfile();
                              }
                            : null,
                        child: const Text(
                          '로그인',
                          style: AppTypography.tapButtonMedium18,
                        ),
                        style: AppButton.xLarge,
                      );
                    })
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
