import 'package:ace/utils/button.dart';
import 'package:ace/utils/typography.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../widgets/text_filed_custom.dart';

void main() {
  runApp(const GetMaterialApp(home: LoginView()));
}

class LoginView extends GetView {
  const LoginView({super.key});
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: const TextStyle(fontFamily: "Pretendard"),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
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
                    child: TextFormFieldCustom(
                        hintText: '이메일 주소를 입력해주세요.',
                        errorText: '이메일 주소가 틀립니다. 다시 한번 입력해주세요.',
                        controller: TextEditingController()),
                  ),
                  Container(
                    height: 66,
                    child: TextFormFieldCustom(
                        hintText: '비밀번호를 입력해주세요.',
                        errorText: '비밀번호가 틀립니다. 다시 한번 입력해주세요.',
                        controller: TextEditingController()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(color: AppColors.neutral60),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('비밀번호 찾기 클릭');
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
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('로그인'),
                    style: AppButton.xLarge,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
