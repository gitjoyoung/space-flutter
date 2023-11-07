import 'dart:convert';

import 'package:ace/routes/api_route.dart';
import 'package:ace/utils/email_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final Rx<String> token = Rx<String>("");
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    // 리스너들
    name.addListener(_pushButtonState);
    email.addListener(_pushButtonState);
    password.addListener(_pushButtonState);
    phone.addListener(_pushButtonState);
  }

  @override
  void onClose() {
    // 컨트롤러들 해제
    email.dispose();
    password.dispose();
    name.dispose();
    phone.dispose();
    super.onClose();
  }

  // 버튼 상태 업데이트 함수
  void _pushButtonState() {
    isLoading.value = name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        phone.text.isNotEmpty;
  }

  // 한글 이름 검증
  bool validateKoreanName(String name) {
    if (name.isEmpty) {
      return false;
    }
    // 정규표현식을 사용하여 한글 이름 체크
    if (!RegExp(r'^[가-힣]{2,4}$').hasMatch(name)) {
      return false;
    }
    return true; // 검증 통과
  }

  // 회원가입 함수
  signup() async {
    // 입력값 가져오기
    String nameInput = name.text;
    String emailInput = email.text;
    String passwordInput = password.text;
    String phoneInput = phone.text;

    // 한글 이름 검증
    if (!validateKoreanName(nameInput)) {
      _showError('사용자 이름에 공백을 포함할 수 없습니다.');
      // ("사용자 이름에 공백을 포함할 수 없습니다.");
      return "사용자 이름에 공백을 포함할 수 없습니다.";
    }

    // 이메일 검증
    if (!EmailValidator.isValid(emailInput)) {
      _showError('올바른 이메일 형식이 아닙니다.');
      // print("올바른 이메일 형식이 아닙니다.");
      return "올바른 이메일 형식이 아닙니다.";
    }

    // 비밀번호 검증
    if (passwordInput.length < 8) {
      _showError('8자리 이상으로 입력해주세요.');
      // print("8자리 이상으로 입력해주세요. ");
      return "8자리 이상으로 입력해주세요.";
    }
    String encodedPassword = base64Encode(utf8.encode(passwordInput));

    // 전화번호 검증
    if (!RegExp(r'^[0-9]+$').hasMatch(phoneInput)) {
      _showError('전화번호는 숫자만 포함해야 합니다');
      // print("전화번호는 숫자만 포함해야 합니다");
      return "전화번호는 숫자만 포함해야 합니다";
    }

    // API 요청
    var res = await Dio().post(
      ApiRoute.signup,
      data: {
        'email': emailInput,
        'password': encodedPassword,
        'name': nameInput,
        'phone': phoneInput,
      },
    );
    print(res.data);

    // 응답 처리
    if (res.data['status'] == 'success') {
      // 성공시 토큰값 저장
      token.value = res.data['data'];
      _showSuccess('회원가입이 완료되었습니다.');
      // print(token.value);
      return null; // 성공 표시
    } else {
      // 실패시 메시지 출력
      // return res.data['message'];
      _showError(res.data['message']);
    }
  }

  void _showError(String message) {
    Get.snackbar('오류', message,
        backgroundColor: Colors.redAccent, snackPosition: SnackPosition.BOTTOM);
  }

  void _showSuccess(String message) {
    Get.snackbar('성공', message,
        backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM);
  }
}
