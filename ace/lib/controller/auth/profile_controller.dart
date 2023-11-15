import 'package:ace/controller/auth/auth_controller.dart';
import 'package:ace/controller/auth/avatar_controller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//프로필 정보를 업데이트하고 새 토큰을 받는 함수를 정의합니다.

class ProfileController extends GetxController {
  final AvatarController avatarController = Get.find<AvatarController>();
  final AuthController authController = Get.find<AuthController>();

//데이터 타입 저장
  var nickname = TextEditingController();
  var bio = 'ㅁㄴㅇ';
  var position = 'DEVELOPER'.obs;
  final Map<String, String> positionMap = {
    '개발자': 'DEVELOPER',
    '디자이너': 'DESIGNER',
    '헤드헌터': 'SCOUTER',
  };

  void updatePosition(String newPositionKey) {
    position.value = positionMap[newPositionKey] ?? '';
    update(); // UI 업데이트를 강제합니다.
  }

// 프로필 정보를 업데이트하고 새 토큰을 받는 함수를 정의합니다.
  Future<void> updateProfile() async {
    try {
      // 토큰을 가져옵니다.
      String token = authController.getToken();
      // 토큰이 비어 있는지 확인합니다.
      if (token.isEmpty) {
        throw Exception('토큰이 없습니다. 로그인이 필요합니다.');
      }
// 아바타 url을 가져옵니다.
      String avatar = avatarController.getAvatarUrl();
      if (avatar.isEmpty) {
        throw Exception('아바타가 없습니다. 로그인이 필요합니다.');
      }

      var response = await Dio().post(
        'https://dev.sniperfactory.com/api/me/profile',
        data: {
          "nickname": nickname.text,
          "bio": bio,
          "position": position.value,
          "avatar": avatar,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        // 새로운 토큰을 받아 저장합니다.
        authController.token.value = response.data['data'];
        print(response.data);

        print('갱신된 토큰' + authController.getToken());
        Get.toNamed(ViewRoute.homePage);
      } else {
        throw Exception('프로필 업데이트에 실패했습니다.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

// AuthController를 초기화하는 함수
  void initAuthController() {
    Get.put(AuthController());
  }
}
