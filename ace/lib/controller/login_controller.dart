import 'package:ace/controller/auth_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = TextEditingController();
  var password = TextEditingController();
  var isButtonEnabled = false.obs;

  login() {
    print('로그인 버튼 클릭');
    try {
      Get.find<AuthController>().login(email.text, password.text);
      
    } catch (e) {
      print('통신실패 : ${e}');
    }
// 반환값 예시
// {
//   "status": "success",
//   "message": "요청을 정상적으로 처리하였습니다.",
//   "data": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsbzNrNWRtaDAwMDBtcjA4aG50aWFsYTMiLCJlbWFpbCI6InNuaXBlcmZhY3RvcnlAZ21haWwuY29tIiwidmVyaWZpZWRFbWFpbCI6ZmFsc2UsInZlcmlmaWVkUGhvbmUiOmZhbHNlLCJuYW1lIjoi7YWM7Iqk7Yq47JWE7J2065SUMjIiLCJwcm9maWxlIjp7ImlkIjoiY2xvM2s3anh2MDAwMW1yMDh0czg4YjF3NiIsIm5pY2tuYW1lIjoiVGVzdDIyIiwiYXZhdGFyIjpudWxsLCJiaW8iOiLthYzsiqTtirjsnoTri7kyMiIsInBvc2l0aW9uIjoiREVWRUxPUEVSIiwicm9sZSI6Ik5FV0JJRSIsImJhZGdlIjpudWxsfSwiaWF0IjoxNjk4MTA1ODY5fQ.pcKQAvtiFgjt3MgePBn42aSkodF4-MUbIdjGVKBiom0",
//   "error": null
// }
  }

  _summitButtonState() {
    isButtonEnabled.value = email.text.isNotEmpty && password.text.isNotEmpty;
  }

  @override
  void onInit() {
    super.onInit();

    email.addListener(() {
      _summitButtonState();
      print("Email 값이 변경됨: ${email.text}");
    });

    password.addListener(() {
      _summitButtonState();
      print("PW 값이 변경됨: ${password.text}");
    });
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
