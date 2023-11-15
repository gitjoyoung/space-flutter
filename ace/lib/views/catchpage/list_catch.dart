import 'package:ace/controller/catch/catch_controller..dart';
import 'package:ace/models/catch/catch_maode2.dart';

import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
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
    // final isTopMogak = title == '핫한 캐치업';

    // final listToDisplay =
    //     isTopMogak ? controller.topCatchModels : controller.allCatchModels;
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
                itemCount: 1,
                itemBuilder: (context, index) {
                  final item = AllCatchModel(
                    id: "clo2q884r0001la085w99s7zm",
                    title: "안드로이드 플러터 앱 release",
                    content: "안드로이드 플러터 앱 release.",
                    url:
                        "https://velog.io/@kw2577/%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C-%ED%94%8C%EB%9F%AC%ED%84%B0-%EC%95%B1-release",
                    thumbnail:
                        "https://velog.velcdn.com/images/kw2577/post/bc2868ed-b910-40ad-adcd-a1099befc091/image.png",
                    // authorId: "clo2moojy0001mg08zd57870v",
                    temperature: 0,
                    // status: "PUBLISHED");
                  );
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
                            // CommentIcon(
                            //   svgIcon: 'assets/icons/icon20/like.svg',
                            //   count: item.temperature,
                            // ),
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
