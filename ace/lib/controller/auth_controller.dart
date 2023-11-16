import 'dart:convert';

import 'package:ace/routes/api_route.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/email_validator.dart';
import 'package:ace/widgets/modal_custom.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rx<String> token = Rx<String>("");
  Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
  }

  Map<String, dynamic>? decodeJwt(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        return null;
      }

      final header = json.decode(utf8.decode(base64Url.decode(parts[0])));
      final payload = json.decode(utf8.decode(base64Url.decode(parts[1])));

      final decodedToken = {
        'header': header,
        'payload': payload,
      };

      return decodedToken;
    } catch (e) {
      return null;
    }
  }

  void showModal(BuildContext context) {
    ModalCustom(
      // 함수 이름을 ModalCustom으로 변경
      '로그인에 실패했습니다.',
      '다시시도해 주세요',
      Icons.warning,
      AppColors.primary80,
      '다시하기',
      () {
        Get.back();
      },
    );
  }

  login(String email, String password) async {
    // 이메일 비밀번호 검증
    if (email.isEmpty || password.isEmpty) {
      print("이메일 또는 비밀번호를 입력하지 않았습니다");
      return "이메일 또는 비밀번호를 입력하지 않았습니다";
    }

    //이메일 양식 검증
    if (!EmailValidator.isValid(email)) {
      print("이메일 양식에 맞지 않습니다");
      return "이메일 양식에 맞지 않습니다";
    }

    // 비밀번호 길이 검증
    if (password.length < 8) {
      print("비밀번호가 8자 미만입니다");
      return "비밀번호가 8자 미만입니다";
    }

    String encodedPassword = base64Encode(utf8.encode(password));
    print(encodedPassword.runtimeType);
    // 'email': "sniperfactory@gmail.com",
    // 'password': "MTIzMTIzMTIz",
    var res = await dio.post(
      ApiRoute.loginAPi,
      data: {
        'email': email,
        'password': encodedPassword,
      },
    );
    print(res.data);
    if (res.data['status'] == 'success') {
      // 성공시 토큰값 업로드

      token.value = res.data['data'];
      print('로그인 성공 : ${token.value}');
      Get.toNamed(ViewRoute.homePage);
    } else {
      // 통신이 실패했을 때만 예외 처리
      print('로그인에 실패했습니다.');
      showModal(Get.context!);
    }
    return res.data['data'];
  }

// 반응형 토큰의 현재 값을 반환합니다.
  String getToken() {
    return token.value;
  }

  // void saveToken(String newToken) {
  //   token.value = newToken;
  // }
}
