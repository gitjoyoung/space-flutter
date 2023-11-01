import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AvatarController extends GetxController {
  var selectedCategory = 'hair'.obs; // 기본 카테고리는 헤어로 설정
  var hairIndex = 1.obs;
  var faceIndex = 1.obs;
  var emotionIndex = 1.obs;
  var itemIndex = 1.obs;
  var hairColorHex = '#030303'.obs;

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

  // 카테고리를 변경하는 함수
  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  // 선택한 에셋의 인덱스를 변경하는 함수
  void changeIndex(int index) {
    switch (selectedCategory.value) {
      case 'hair':
        hairIndex.value = index;
        break;
      case 'face':
        faceIndex.value = index;
        break;
      case 'emotion':
        emotionIndex.value = index;
        break;
      case 'item':
        itemIndex.value = index;
        break;
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
}
