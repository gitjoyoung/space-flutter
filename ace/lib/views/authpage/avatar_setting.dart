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
                      color: controller.hairColor.value,
                      colorBlendMode: BlendMode.srcIn,
                    ),
                    SvgPicture.asset(
                        'assets/emotion/off_emotion_${controller.emotionIndex}.svg'),
                    controller.selectedCategory.value == 'item'
                        ? SvgPicture.asset(
                            'assets/item/off_item_${controller.itemAssets[controller.itemIndex.value - 1]}.svg')
                        : SvgPicture.asset(
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
              ['헤어', 'hair'],
              ['표정', 'emotion'],
              ['피부', 'face'],
              ['아이템', 'item']
            ].map((category) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide.none,
                  ),
                  elevation: 0.0, // 버튼 그림자 제거
                ),
                onPressed: () => controller.changeCategory(category[1]),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color:
                                controller.selectedCategory.value == category[1]
                                    ? Colors.blue
                                    : Colors.transparent,
                            width: 2.0)),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(category[0],
                      style: TextStyle(
                          color:
                              controller.selectedCategory.value == category[1]
                                  ? Colors.blue
                                  : Colors.grey)),
                ),
              );
            }).toList(),
          ),
          Obx(() {
            if (controller.selectedCategory.value == 'hair') {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.hairColors.map((color) {
                  return ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(color)),
                    onPressed: () => controller.changeHairColor(color),
                    child: Container(width: 30, height: 30), // 색상 표시 영역
                  );
                }).toList(),
              );
            } else {
              return SizedBox.shrink(); // 헤어 카테고리가 아니면 아무 것도 표시하지 않습니다.
            }
          }),

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
                  count = controller.itemAssets.length;
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
                    child: controller.selectedCategory.value == 'item'
                        ? SvgPicture.asset(
                            'assets/item/off_item_${controller.itemAssets[index]}.svg')
                        : (controller.selectedCategory.value == 'hair'
                            ? SvgPicture.asset(
                                'assets/hair/off_hair_${index + 1}.svg',
                                color: controller.hairColor.value,
                                colorBlendMode: BlendMode.srcIn,
                              )
                            : SvgPicture.asset('assets/$path${index + 1}.svg')),
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
