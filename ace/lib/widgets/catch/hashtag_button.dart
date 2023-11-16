import 'package:ace/controller/catch/catch_controller..dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HashTagButton extends StatelessWidget {
  final List<String> hashTags;
  final String assetPath;
  final CatchController controller = Get.find();

  HashTagButton({Key? key, required this.hashTags, required this.assetPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 선택된 해시태그가 현재 리스트에 있으면 해제, 아니면 첫 번째 해시태그로 설정
        String currentTag = controller.selectedHashTag.value;
        if (hashTags.contains(currentTag)) {
          controller.updateSelectedHashTag('');
        } else {
          controller.updateSelectedHashTag(hashTags.first);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Obx(() {
          // Obx를 사용하여 선택 상태에 반응하게 함
          bool isSelected =
              hashTags.any((tag) => controller.selectedHashTag.value == tag);
          return Container(
            decoration: BoxDecoration(
              border:
                  isSelected ? Border.all(color: Colors.blue, width: 2) : null,
              borderRadius: BorderRadius.circular(4),
            ),
            child: SvgPicture.asset(assetPath),
          );
        }),
      ),
    );
  }
}
