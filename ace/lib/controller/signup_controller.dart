import 'dart:convert';

import 'package:ace/controller/auth_controller.dart';
import 'package:ace/routes/api_route.dart';
import 'package:ace/routes/view_route.dart';

import 'package:ace/utils/email_validator.dart';
import 'package:ace/views/authpage/sign_up_success.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final AuthController authController = Get.find<AuthController>();

  final Rx<String> token = Rx<String>("");
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    name.addListener(_pushButtonState);
    email.addListener(_pushButtonState);
    password.addListener(_pushButtonState);
    phone.addListener(_pushButtonState);
  }

  // @override
  // void onClose() {
  //   email.dispose();
  //   password.dispose();
  //   name.dispose();
  //   phone.dispose();
  //   super.onClose();
  // }

  void _pushButtonState() {
    isLoading.value = name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        phone.text.isNotEmpty;
  }

  bool validateKoreanName(String name) {
    return RegExp(r'^[가-힣]{2,4}$').hasMatch(name);
  }

  Future<void> signup() async {
    isLoading.value = true;

    String nameInput = name.text.trim();
    String emailInput = email.text.trim();
    String passwordInput = password.text.trim();
    String phoneInput = phone.text.trim();

    if (!validateKoreanName(nameInput)) {
      _showError('사용자 이름을 올바르게 입력해주세요.');
      isLoading.value = false;
      return;
    }

    if (!EmailValidator.isValid(emailInput)) {
      _showError('올바른 이메일 형식이 아닙니다.');
      isLoading.value = false;
      return;
    }

    if (passwordInput.length < 8) {
      _showError('비밀번호는 8자리 이상이어야 합니다.');
      isLoading.value = false;
      return;
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(phoneInput)) {
      _showError('전화번호는 숫자만 포함해야 합니다');
      isLoading.value = false;
      return;
    }

    String encodedPassword = base64Encode(utf8.encode(passwordInput));

    try {
      var response = await Dio().post(
        ApiRoute.signup,
        data: {
          'email': emailInput,
          'password': encodedPassword,
          'name': nameInput,
          'phone': phoneInput,
        },
      );

      if (response.data['status'] == 'success') {
        token.value = response.data['data'] ?? '';
        if (token.value.isNotEmpty) {
          _showSuccess('회원가입이 완료되었습니다.');

          print(response.data['data']);

          authController.saveToken(response.data['data']);

          Get.to(() => const SignUpSuccess());
        } else {
          _showError('회원가입은 성공했지만, 토큰을 받지 못했습니다.');
          print('실패');
        }
      } else {
        _showError(response.data['message'] ?? '알 수 없는 오류가 발생했습니다.');
      }
    } catch (e) {
      _showError('회원가입 중 문제가 발생했습니다: ${e.toString()}');
    } finally {
      isLoading.value = false;
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
