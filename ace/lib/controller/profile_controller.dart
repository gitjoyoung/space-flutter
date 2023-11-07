import 'package:ace/controller/auth_controller.dart';
import 'package:ace/controller/avatar_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final AvatarController avatarController = Get.find<AvatarController>();

  var nickname = TextEditingController();
  var bio = '';
  var position = ''.obs;

  void updatePosition(String newPosition) {
    position.value = newPosition;
    print(position.value);
  }

// 프로필 정보를 업데이트하고 새 토큰을 받는 함수를 정의합니다.
  Future<void> updateProfile(
      String imageUrl, Map<String, dynamic> profileData) async {
    try {
      String token = Get.find<AuthController>().getToken();
      String avatar = avatarController.getAvatarUrl();

      var response = await Dio().post(
        'https://your-api-endpoint.com/update_profile',
        data: {
          'nickname': nickname,
          'bio': bio,
          'position': position,
          'avatar': avatar,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        // 새로운 토큰을 받아 저장합니다.
        Get.find<AuthController>().saveToken(response.data['data']);
      } else {
        throw Exception('프로필 업데이트에 실패했습니다.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

// AuthController를 초기화하는 함수
// void initAuthController() {
//   Get.put(AuthController());
// }
}
