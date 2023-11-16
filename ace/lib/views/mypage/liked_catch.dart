import 'package:ace/controller/catch/catch_filter.dart';
import 'package:ace/controller/my/my_controller.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/catch/my_liked_catchcontents.dart';
import 'package:ace/widgets/common/comment_Icon.dart';

import 'package:ace/widgets/common/space_appbar.dart';
import 'package:ace/widgets/common/title_appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class LikedCatch extends GetView<MyController> {
  const LikedCatch({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpaceAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(children: [
            TitleAppBarCustom(
              title: "좋아요 한 캐치업",
            ),
            InkWell(
              onTap: () => showCustomDialog(context),
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
              final listToDisplay = controller.myCatchLikedList;

              // 데이터가 없을 때 메시지 표시
              if (listToDisplay.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 150),
                        Text("좋아요한 캐치업이 없습니다", style: AppTypography.cardBody),
                      ],
                    ),
                  ),
                );
              } else {
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
                                child: MyLikedCatchContent(
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
                                count: item.catchUp!.temperature!,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ); //
                  },
                );
              }
            }),
          ]),
        ),
      ),
    );
  }
}
