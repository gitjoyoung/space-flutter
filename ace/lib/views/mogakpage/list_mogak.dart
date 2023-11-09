import 'package:ace/controller/mogak/mogak_cotroller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/comment_Icon.dart';
import 'package:ace/widgets/space_appbar.dart';
import 'package:ace/widgets/title_appbar_custom.dart';
import 'package:ace/widgets/mogak_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MogakList extends GetView<MogakController> {
  const MogakList({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    final isTopMogak = title == '핫한 모각코';

    final listToDisplay =
        isTopMogak ? controller.topMogakModels : controller.allMogakModels;
    return Scaffold(
      appBar: SpaceAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(children: [
            TitleAppBarCustom(
              title: title,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    'assets/icons/icon30/Filter.svg',
                    height: 16,
                    width: 16,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    '날자순',
                    style: AppTypography.cardBody
                        .copyWith(color: AppColors.primary80),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Obx(() {
              // allMogakModels 리스트를 이용하여 ListView.builder로 목록을 구성합니다.
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
                          child: MogakContent(
                            data: item,
                            maxLength: 5,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CommentIcon(
                              svgIcon: 'assets/icons/icon20/plus.svg',
                              count: item.appliedProfiles?.length ?? 0,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CommentIcon(
                              svgIcon: 'assets/icons/icon20/like.svg',
                              count: item.temperature,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ); // MogakContent 위젯에 데이터를 전달합니다.
                },
              );
            }),
          ]),
        ),
      ),
    );
  }
}
