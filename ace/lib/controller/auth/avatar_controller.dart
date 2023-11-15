import 'dart:typed_data';

import 'package:ace/controller/auth/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class AvatarController extends GetxController {
  Dio dio = Dio();

  var selectedCategory = 'hair'.obs; // 기본 카테고리는 헤어로 설정
  var hairIndex = 1.obs;
  var faceIndex = 1.obs;
  var emotionIndex = 1.obs;
  var itemIndex = 1.obs;
  var hairColorHex = '#030303'.obs;
  RxString avatarUrl = RxString('');

  final List<String> itemAssets = [
    'angel',
    'beard',
    'bone',
    'cat',
    'devil',
    'flower',
    'glasses1',
    'glasses2',
    'graduate',
    'hand',
    'hat',
    'magician',
    'mask',
    'rabbit',
    'ribbon',
    'star',
    'sunglass',
    'tiara'
  ];

  final List<List<String>> categories = [
    ['헤어', 'hair'],
    ['피부', 'face'],
    ['표정', 'emotion'],
    ['아이템', 'item'],
  ].obs; // .obs를 사용하여 반응형 리스트로 만듭니다.

  // ... 기존 코드 ...

  // 카테고리를 변경하는 함수
  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  // 선택한 카테고리의 인덱스를 변경하는 함수
  void changeIndex(int index) {
    var indexMap = {
      'hair': () => hairIndex.value = index,
      'face': () => faceIndex.value = index,
      'emotion': () => emotionIndex.value = index,
      'item': () => itemIndex.value = index,
    };

    // 선택한 카테고리에 따라 인덱스를 변경합니다.
    var func = indexMap[selectedCategory.value];
    if (func != null) {
      func();
    } else {
      print("Invalid category");
    }
  }

  final hairColor = Rx<Color>(Colors.black); // 기본 색상 설정
  final List<Color> hairColors = [
    const Color(0xFF030303), // 검정색
    const Color(0xFFB3B3B3), // 회색
    const Color(0xFF925319), // 갈색
    const Color(0xFF6B4D20), // 짙은 갈색
    const Color(0xFFEDD0AD), // 연한 갈색
    const Color(0xFF337AFF), // 파란색
    const Color(0xFFFF7777), // 분홍색
    const Color(0xFFB33CDD),
    // 다른 색상들 추가
  ];

  void changeHairColor(Color color) {
    hairColor.value = color;
  }

  // 새로 추가된 부분: 카테고리에 따른 count와 path를 가져오는 메소드
  Map<String, dynamic> getCategoryDetails(String category) {
    var detailsMap = {
      'hair': {
        'count': 24,
        'path': 'hair/off_hair_',
      },
      'face': {
        'count': 9,
        'path': 'face/on_face_',
      },
      'emotion': {
        'count': 24,
        'path': 'emotion/off_emotion_',
      },
      'item': {
        'count': itemAssets.length,
        'path': 'item/off_item_',
      },
    };

    // 카테고리에 따른 count와 path를 반환합니다.
    return detailsMap[category] ?? {'count': 0, 'path': ''};
  }

  // 아바타 초기화 메소드
  void resetAvatar() {
    hairIndex.value = 1;
    faceIndex.value = 1;
    emotionIndex.value = 1;
    itemIndex.value = 1;
    hairColor.value = Colors.black;

    update(); // GetX 상태 업데이트를 호출합니다.
  }

  ScreenshotController screenshotController = ScreenshotController();

  // 스크린샷 캡처하고 API에 업로드
  Future<void> uploadAvatarImage() async {
    try {
      Uint8List? uint8list = (await screenshotController.capture());

      Dio dio = Dio();

      String authToken =
          'Bearer ${Get.find<AuthController>().getToken()}'; // Replace with your access token

      var formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          uint8list!,
          filename: 'screenshot.png',
        ),
      });

      var response = await dio.post(
        'https://dev.sniperfactory.com/api/upload',
        options: Options(headers: {
          'Authorization': authToken, // set content-length
        }),
        data: formData,
      );

      if (response.statusCode == 200) {
        var imagedata = response.data['data'];
        var avatarImageUrl = imagedata[0]['url'];
        avatarUrl.value = avatarImageUrl;
        print(avatarUrl.value);
      } else {
        print('이미지 업로드 실패: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  String getAvatarUrl() {
    return avatarUrl.value;
  }
}
