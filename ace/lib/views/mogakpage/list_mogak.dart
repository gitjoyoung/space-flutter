import 'package:ace/controller/mogak/mogak_cotroller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/comment_Icon.dart';
import 'package:ace/widgets/space_appbar.dart';
import 'package:ace/widgets/title_appbar_custom.dart';
import 'package:ace/widgets/mogak/mogak_content.dart';
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
              onTap: () {
                controller.sortMogaksByDate();
              },
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
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
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
                              svgIcon: 'assets/icons/icon20/Chat2.svg',
                              count: item.talks?.length ?? 0,
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
                  );
                },
              );
            }),
          ]),
        ),
      ),
    );
  }
}
