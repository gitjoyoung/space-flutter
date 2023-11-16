import 'package:ace/controller/catch/catch_controller..dart';

import 'package:ace/models/catch/catch_model.dart';

import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/catch/catch_content.dart';
import 'package:ace/widgets/catch/hashtag_button.dart';
import 'package:ace/widgets/common/catchup_contents.dart';
import 'package:ace/widgets/common/comment_Icon.dart';
import 'package:ace/widgets/common/space_appbar.dart';
import 'package:ace/widgets/common/title_appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CatchList extends GetView<CatchController> {
  const CatchList({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    final isTopCatch = title == '핫한 캐치업';

    final listToDisplay =
        isTopCatch ? controller.topCatchModels : controller.allCatchModels;
    return Scaffold(
      appBar: SpaceAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(children: [
            TitleAppBarCustom(
              title: title,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // CatchController의 buildHashTagButton 함수를 호출하여 해시 태그 버튼 생성
                HashTagButton(
                  hashTags: ['플러터', 'flutter'],
                  assetPath: 'assets/icons/icon50/Flutter.svg',
                ),
                HashTagButton(
                  hashTags: ['파이썬', 'Python'],
                  assetPath: 'assets/icons/icon50/Python.svg',
                ),
                HashTagButton(
                  hashTags: ['자바', 'Java'],
                  assetPath: 'assets/icons/icon50/Js.svg',
                ),
                HashTagButton(
                  hashTags: ['리액트', 'React'],
                  assetPath: 'assets/icons/icon50/React.svg',
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Obx(() {
              final listToDisplay = controller.filteredCatchModels;
              // allCatchModels 리스트를 이용하여 ListView.builder로 목록을 구성합니다.
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap:
                    true, // SingleChildScrollView 내부에서 ListView를 사용하려면 이를 추가합니다.
                itemCount: listToDisplay.length,
                itemBuilder: (context, index) {
                  final item = listToDisplay[index];
                  return Column(
                    children: [
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: AppColors.strokeLine10, width: 1.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: CatchContent(
                                data: item,
                                maxLength: 3,
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child: Container(
                                  height: 220,
                                  decoration: BoxDecoration(
                                    // 이미지를 추가하고 싶다면 아래처럼 사용:
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/profile/rocket.png'), // 이미지 에셋의 경로를 지정
                                      fit: BoxFit.cover, // 이미지를 꽉 채우도록 설정
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  )),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CommentIcon(
                              svgIcon: 'assets/icons/icon20/like.svg',
                              count: item.temperature!,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ); //
                },
              );
            }),
          ]),
        ),
      ),
    );
  }
}
