import 'package:ace/controller/avatar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(home: AvatarCustomizer()));
}

class AvatarCustomizer extends StatelessWidget {
  final AvatarController controller = Get.put(AvatarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("아바타 설정")),
      body: Column(
        children: [
          // 1. 상단의 아바타 표시

          Expanded(
            flex: 2,
            child: Center(
              child: Obx(() {
                return Stack(
                  children: [
                    SvgPicture.asset(
                        'assets/face/on_face_${controller.faceIndex}.svg'),
                    SvgPicture.asset(
                      'assets/hair/off_hair_${controller.hairIndex}.svg',
                    ),
                    SvgPicture.asset(
                        'assets/emotion/off_emotion_${controller.emotionIndex}.svg'),
                    SvgPicture.asset(
                        'assets/item/off_item_${controller.itemIndex}.svg'),
                  ],
                );
              }),
            ),
          ),

          // 2. 카테고리 선택 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () => controller.changeCategory('hair'),
                  child: Text("헤어")),
              ElevatedButton(
                  onPressed: () => controller.changeCategory('emotion'),
                  child: Text("표정")),
              ElevatedButton(
                  onPressed: () => controller.changeCategory('face'),
                  child: Text("피부")),
              ElevatedButton(
                  onPressed: () => controller.changeCategory('item'),
                  child: Text("아이템")),
            ],
          ),

          // 3. 하단의 에셋 그리드
          Expanded(
            flex: 3,
            child: Obx(() {
              int count = 0; // 초기값 설정
              String path = ''; // 초기값 설정
              switch (controller.selectedCategory.value) {
                case 'hair':
                  count = 24;
                  path = 'hair/off_hair_';
                  break;
                case 'face':
                  count = 9;
                  path = 'face/on_face_';
                  break;
                case 'emotion':
                  count = 24;
                  path = 'emotion/off_emotion_';
                  break;
                case 'item':
                  count = 18;
                  path = 'item/off_item_';
                  break;
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: count,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.changeIndex(index + 1);
                    },
                    child: SvgPicture.asset('assets/$path${index + 1}.svg'),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
