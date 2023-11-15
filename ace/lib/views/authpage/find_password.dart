import 'package:ace/controller/auth/find_password_controller.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/email_validator.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/common/modal_custom.dart';
import 'package:ace/widgets/common/text_filed_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(FindPasswordController());

  runApp(const GetMaterialApp(home: FindPassword()));
}

class FindPassword extends GetView<FindPasswordController> {
  const FindPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: AppColors.neutral80,
            size: 20,
          ),
          title: Text('비밀번호 찾기',
              style: AppTypography.tapButtonBold18
                  .copyWith(color: AppColors.neutral80))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '''기존에 가입하신 이메일을 입력하시면, \n 새로운 비밀번호를 보내드립니다.''',
                    style: AppTypography.button36Regular,
                  ),
                )),
                SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '이메일',
                      style: AppTypography.button28Bold,
                    ),
                    TextFieldCustom(
                        validator: EmailValidator.isValid,
                        hintText: '이메일을 입력해주세요.',
                        errorText: '이메일 주소가 틀립니다. 다시 한번 입력해주세요.',
                        controller: controller.email),
                  ],
                ),
                SizedBox(
                  height: 300,
                ),
                Obx(() {
                  return ElevatedButton(
                    onPressed: controller.isButtonEnabled.value
                        ? () async {
                            // try-catch 구문을 추가하여 에러를 처리합니다.
                            try {
                              bool result = await controller.findPassword();
                              if (result) {
                                // 성공: 모달 표시
                                ModalCustom(
                                    '새로운 비밀번호를 보냈습니다.',
                                    '메일함을 확인하세요',
                                    Icons.send,
                                    AppColors.primary80,
                                    '확인하기', () {
                                  Get.back();
                                });
                              } else {}
                            } catch (error) {
                              print(error);
                            }
                          }
                        : null,
                    child: const Text(
                      '보내기',
                      style: AppTypography.tapButtonMedium18,
                    ),
                    style: AppButton.xLarge,
                  );
                })
              ]),
        ),
      ),
    );
  }
}
