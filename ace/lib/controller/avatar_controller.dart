import 'package:get/get.dart';

class AvatarController extends GetxController {
  var selectedCategory = 'hair'.obs; // 기본 카테고리는 헤어로 설정
  var hairIndex = 1.obs;
  var faceIndex = 1.obs;
  var emotionIndex = 1.obs;
  var itemIndex = 1.obs;
  var hairColor = '#030303'.obs;

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

  // 헤어의 색상을 변경하는 함수
  void changeHairColor(String color) {
    hairColor.value = color;
  }
}
