import 'package:ace/routes/api_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  var newPassword = TextEditingController();
  var currentPassword = TextEditingController();
  final Dio _dio = Dio();
  final RxString token = RxString("");

  var isLoading = false.obs;
  var isSuccess = false.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = Get.arguments;
  }

  Future<void> changePasswordstate(
      String currentPassword, String newPassword) async {
    isLoading.value = true;
    isSuccess.value = false;

    try {
      String? storedToken = token.value;
      if (storedToken.isEmpty) {
        throw Exception("토큰을 찾을 수 없습니다.");
      }
      _dio.options.headers['Authorization'] = 'Bearer $storedToken';

      var response = await _dio.post(
        ApiRoute.changePasswordApi,
        data: {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
        },
      );

      if (response.data['status'] == 'success') {
        isSuccess.value = true;
        print('비밀번호 변경 완료');
      } else {
        print('비밀번호 변경 실패: ${response.data['message']}');
      }
    } catch (e) {
      print('예외 발생: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
