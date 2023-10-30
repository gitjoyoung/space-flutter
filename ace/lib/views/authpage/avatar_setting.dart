import 'package:ace/controller/avatar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(home: AvatarSettingPage()));
}

class AvatarSettingPage extends StatelessWidget {
  final AvatarController avatarController = Get.put(AvatarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('아바타 설정')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return Stack(
                children: [
                  SvgPicture.asset('assets/face/on_face_1.svg',
                      color: avatarController.currentAvatar.value.color),
                  SvgPicture.asset(
                      'assets/hair/off_hair_${avatarController.currentAvatar.value.hair}.svg'),
                  // ... 다른 SVG 레이어들
                ],
              );
            }),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemCount: 24, // 헤어 스타일 수
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    avatarController
                        .updateHair((index + 1).toString()); // 숫자로 헤어 업데이트
                  },
                  child: SvgPicture.asset(
                      'path_to_hair_icon/hair_icon_${index + 1}.svg'),
                );
              },
            ),
          ),
          Row(
            children: [
              // 색상 선택자
              ColorOption(Colors.blue, avatarController.updateColor),
              ColorOption(Colors.brown, avatarController.updateColor),
              ColorOption(Colors.black, avatarController.updateColor),
              ColorOption(Colors.pink, avatarController.updateColor),
              // ... 다른 색상들
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // 설정 저장 및 페이지 닫기
            },
            child: Text('저장하기'),
          ),
        ],
      ),
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;
  final Function(Color) onSelect;

  ColorOption(this.color, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(color),
      child: Container(
        width: 50,
        height: 50,
        color: color,
      ),
    );
  }
}
