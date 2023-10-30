import 'dart:convert';

import 'package:ace/routes/api_route.dart';
import 'package:ace/utils/email_validator.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rx<String> token = Rx<String>("");

  @override
  void onInit() {
    super.onInit();
  }

  Dio dio = Dio();

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

    // 'email': "sniperfactory@gmail.com",
    // 'password': "MTIzMTIzMTIz",
    var res = await dio.post(
      ApiRoute.login,
      data: {
        'email': email,
        'password': encodedPassword,
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
