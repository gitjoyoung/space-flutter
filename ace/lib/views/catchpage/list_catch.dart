import 'package:ace/controller/catch/catch_controller..dart';

import 'package:ace/models/catch/catch_model.dart';

import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/catchup_contents.dart';
import 'package:ace/widgets/comment_Icon.dart';
import 'package:ace/widgets/space_appbar.dart';
import 'package:ace/widgets/title_appbar_custom.dart';
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
                InkWell(
                  onTap: () {
                    controller.selectedHashTag();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: SvgPicture.asset('assets/icons/icon50/Flutter.svg'),
                    // 여기에 원하는 간격을 추가
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.selectedHashTag();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child:
                        // 여기에 원하는 간격을 추가
                        SvgPicture.asset('assets/icons/icon50/Python.svg'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.selectedHashTag();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: SvgPicture.asset('assets/icons/icon50/Js.svg'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.selectedHashTag();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: SvgPicture.asset('assets/icons/icon50/React.svg'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Obx(() {
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
                          elevation: 0, // 그림자 제거
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: AppColors.strokeLine10,
                                width: 1.0), // 윤곽선 색과 두께 설정
                            borderRadius:
                                BorderRadius.circular(10), // 윤곽선 둥글기 설정
                          ),
                          child: CatchupContent(
                            data: item,
                            maxLength: 5,
                          )),
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
