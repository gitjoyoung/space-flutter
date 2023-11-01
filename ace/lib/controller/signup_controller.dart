import 'dart:convert';

import 'package:ace/routes/api_route.dart';
import 'package:ace/utils/email_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final Rx<String> token = Rx<String>("");
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  var phone = TextEditingController();
  var isLoading = false.obs;

  _pushButtonState() {
    isLoading.value = email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        name.text.isNotEmpty &&
        phone.text.isNotEmpty;
  }

  @override
  void onInit() {
    super.onInit();

    name.addListener(() {
      _pushButtonState();
      print("Name 값이 변경됨: ${name.text}");
    });
    email.addListener(() {
      _pushButtonState();
      print("Email 값이 변경됨: ${email.text}");
    });
    password.addListener(() {
      _pushButtonState();
      print("PW 값이 변경됨: ${password.text}");
    });
    phone.addListener(() {
      _pushButtonState();
      print("Phone 값이 변경됨: ${phone.text}");
    });
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    name.dispose();
    phone.dispose();
    super.onClose();
  }

  Dio dio = Dio();

  singup(String name, String emai, String password, String phone) async {
    // 이름 공백 검증
    if (name.contains(' ')) {
      // print("사용자 이름에 공백을 포함할 수 없습니다");
      return "사용자 이름에 공백을 포함할 수 없습니다";
    }
    //이메일 양식 검증
    if (!EmailValidator.isValid(emai)) {
      print("올바른 이메일 형식이 아닙니다.");
      return "올바른 이메일 형식이 아닙니다.";
    }

    // 비밀번호 길이 검증
    if (password.length < 8) {
      print("8자리 이상으로 입력해주세요. ");
      return "8자리 이상으로 입력해주세요.";
    }
    String encodedPassword = base64Encode(utf8.encode(password));

    // 전화번호가 숫자만으로 이루어져 있는지 확인
    //문자열이 숫자로만 구성되어 있는지를 검사
    RegExp numberRegExp = RegExp(r'^[0-9]+$');
    if (!numberRegExp.hasMatch(phone)) {
      // print("전화번호는 숫자만 포함해야 합니다");
      return "전화번호는 숫자만 포함해야 합니다";
    }

    var res = await dio.post(
      ApiRoute.signup,
      data: {
        'email': emai,
        'password': encodedPassword,
        'name': name,
        'phone': phone,
      },
    );
    if (res.data['status'] == 'success') {
      // 성공시 토큰값 업로드
      print(res.data);

      token.value = res.data['data'];
      print(token.value);
    }
  }
}
