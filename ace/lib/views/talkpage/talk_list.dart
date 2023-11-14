import 'package:ace/controller/talk/talk_controller.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/badge_avatar_custom.dart';
import 'package:ace/widgets/space_appbar.dart';
import 'package:ace/widgets/talk/talk_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TalkList extends GetView<TalkController> {
  const TalkList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpaceAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 10.0), // 좌우 패딩 설정
              height: 68.0, // 일반적인 앱바의 높이
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // 요소들을 양 끝으로 정렬
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                      // 뒤로가기 버튼 기능, 예를 들어 Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/icon20/left.svg',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Text('톡 디테일 페이지', style: AppTypography.tapButtonBold18),
                  Opacity(
                    opacity: 0, // 오른쪽에 똑같은 공간을 만들기 위해 투명한 아이콘을 넣음
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ],
              ),
            ),
            Obx(() => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.talkModels.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 10, left: 10),
                      child: CustomTalkWidget(
                          talkModel: controller.talkModels[index]),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
