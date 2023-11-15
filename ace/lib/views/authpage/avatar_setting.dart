import 'package:ace/controller/auth/auth_controller.dart';
import 'package:ace/controller/auth/avatar_controller.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';



class AvatarCustomizer extends GetView<AvatarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('  아바타 설정',
            style: AppTypography.popupTitleBold.copyWith(color: Colors.black)),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Get.back(); // GetX를 사용하여 다이얼로그를 닫습니다.
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              style: AppButton.mediumOutLine,
              onPressed: () {
                controller.resetAvatar();
              },
              child: Text(
                '초기화',
                style: AppTypography.tapButtonSubtitle16
                    .copyWith(color: AppColors.primary60),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ElevatedButton(
              style: AppButton.medium,
              onPressed: () {
                controller.uploadAvatarImage();
                Get.back();
              },
              child: const Text(
                '저장하기',
              ),
            ),
          )
        ],
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 1. 상단의 아바타 표시

          Center(
            child: Obx(() {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/profile/avatar_background.png'),
                    Screenshot(
                      controller: controller.screenshotController,
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                              'assets/face/on_face_${controller.faceIndex}.svg'),
                          SvgPicture.asset(
                            'assets/hair/off_hair_${controller.hairIndex}.svg',
                            color: controller.hairColor.value,
                          ),
                          SvgPicture.asset(
                              'assets/emotion/off_emotion_${controller.emotionIndex}.svg'),
                          SvgPicture.asset(
                              'assets/item/off_item_${controller.itemAssets[controller.itemIndex.value - 1]}.svg')
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),

          // 2. 카테고리 선택 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.categories.map((category) {
              return Obx(() {
                bool isSelected = controller.selectedCategory.value ==
                    category[1]; // 현재 선택된 카테고리 확인
                return TextButton(
                  onPressed: () {
                    controller.changeCategory(category[1]);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent, // 버튼 배경색을 투명하게 설정합니다.
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0), // 각진 모서리로 변경
                    ),
                    // 버튼의 전체 패딩을 없애고 텍스트에만 패딩을 적용
                    padding: EdgeInsets.zero,
                    // 버튼의 최소 크기를 0으로 설정하여 패딩과 마진이 없게 합니다.
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize
                        .shrinkWrap, // 버튼의 탭 영역을 텍스트 영역에 맞춤
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0), // 텍스트에만 패딩 적용
                    decoration: BoxDecoration(
                      border: isSelected
                          ? Border(
                              bottom: BorderSide(
                                  color: Colors.blue,
                                  width: 2)) // 선택됐을 때만 하단 보더 강조
                          : Border(
                              bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1)), // 선택되지 않았을 때는 보더 없음
                    ),
                    child: Text(
                      category[0],
                      style: TextStyle(
                        color: isSelected ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                );
              });
            }).toList(),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(() {
            if (controller.selectedCategory.value == 'hair') {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 5.0, vertical: 8), // 여기에서 Row 전체에 좌우 패딩을 추가합니다.
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround, // 균등한 간격으로 정렬
                  children: controller.hairColors.map((color) {
                    bool isSelected = controller.hairColor.value == color;
                    return Expanded(
                      // Expanded 위젯을 사용하여 사용 가능한 공간을 균등하게 나눕니다.
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: color, // 버튼 배경 색상
                          shape: CircleBorder(
                            side: BorderSide(
                              color:
                                  isSelected ? Colors.blue : Colors.transparent,
                              width: isSelected ? 4 : 0,
                            ),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () => controller.changeHairColor(color),
                        child: Container(
                          alignment: Alignment.center,
                          // 추가적인 스타일링이나 아이콘을 여기에 추가할 수 있습니다.
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            } else {
              return SizedBox.shrink(); // 헤어 카테고리가 아니면 아무 것도 표시하지 않습니다.
            }
          }),

          // 3. 하단의 에셋 그리드
          Expanded(
            flex: 3,
            child: Obx(() {
              var categoryDetails = controller
                  .getCategoryDetails(controller.selectedCategory.value);
              int count = categoryDetails['count'];
              String path = categoryDetails['path'];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 1.0,
                ),
                child: Container(
                  color:
                      AppColors.background5, // GridView.builder 전체 배경색을 회색으로 설정
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // 한 줄에 몇 개의 항목을 표시할 것인지 설정합니다.
                        crossAxisSpacing: 10, // 가로 항목 사이의 간격
                        mainAxisSpacing: 10, // 세로 항목 사이의 간격
                      ),
                      itemCount: count,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.changeIndex(index + 1);
                          },
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: AppColors.neutral10,
                                  width: 2), // 테두리 색상과 너비
                              borderRadius:
                                  BorderRadius.circular(8), // 테두리의 둥근 정도
                            ), // Adjust padding as needed
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Always add the first face asset if the hair category is selected
                                if (controller.selectedCategory.value ==
                                        'hair' ||
                                    controller.selectedCategory.value ==
                                        'emotion')
                                  SvgPicture.asset('assets/face/on_face_1.svg'),
                                // Determine which asset to display based on the selected category
                                Obx(() {
                                  if (controller.selectedCategory.value ==
                                      'item') {
                                    return SvgPicture.asset(
                                        'assets/item/off_item_${controller.itemAssets[index]}.svg');
                                  } else if (controller
                                          .selectedCategory.value ==
                                      'hair') {
                                    return SvgPicture.asset(
                                      'assets/hair/off_hair_${index + 1}.svg',
                                      color: controller.hairColor.value,
                                      colorBlendMode: BlendMode.srcIn,
                                    );
                                  } else if (controller
                                          .selectedCategory.value ==
                                      'face') {
                                    return SvgPicture.asset(
                                      'assets/face/on_face_${index + 1}.svg',
                                    );
                                  } else {
                                    return SvgPicture.asset(
                                        'assets/${controller.selectedCategory.value}/off_${controller.selectedCategory.value}_${index + 1}.svg');
                                  }
                                }),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
