import 'package:ace/routes/api_route.dart';
import 'package:ace/utils/email_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindPasswordController extends GetxController {
  var email = TextEditingController();
  var isButtonEnabled = false.obs;

  Dio dio = Dio();

  _summitButtonState() {
    isButtonEnabled.value = email.text.isNotEmpty;
  }

  @override
  void onInit() {
    super.onInit();

    email.addListener(() {
      _summitButtonState();
      print("Email 값이 변경됨: ${email.text}");
    });
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }

  findPassword() async {
    // 이메일 비밀번호 검증
    if (!EmailValidator.isValid(email.text)) {
      print("이메일 양식에 맞지 않습니다");

      return "이메일 양식에 맞지 않습니다";
    }
    var res = await dio.post(
      ApiRoute.forgetPassword,
      data: {
        'email': email.text,
      },
    );
    print(res.data);
    if (res.data['status'] == 'success') {
      print('비밀번호 이메일로 보냈습니다 ');
    }
  }
}
