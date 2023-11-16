import 'package:ace/controller/talk/talk_controller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/talk/talk_content.dart';
import 'package:ace/widgets/talk/talk_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Talk extends GetView<TalkController> {
  const Talk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.createTalkModal();
        },
        elevation: 0,
        backgroundColor: AppColors.primary80,
        child: Image.asset('assets/icons/icon50/Community.png'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 10, right: 10, bottom: 16),
            child: Obx(
              () => controller.talkModels.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: TalkSkeleton(repeatCount: 5),
                      ),
                    )
                  : Column(children: [
                      Container(
                        height: 48,
                        child: TextField(
                          onChanged: (value) {},
                          onSubmitted: (value) {},
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10.0),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Icon(
                                Icons.search,
                                size: 18,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.strokeLine05, width: 2.0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: '내용 검색하기',
                            hintStyle: AppTypography.button36Regular
                                .copyWith(color: AppColors.neutral20),
                          ),
                        ),
                      ),
                      // 상단바
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            SvgPicture.asset('assets/icons/icon20/fire.svg'),
                            SizedBox(width: 8),
                            Text('핫한 톡', style: AppTypography.tapButtonBold18),
                          ],
                        ),
                        trailing: InkWell(
                            onTap: () {
                              Get.toNamed(ViewRoute.talkDetailPage,
                                  arguments: '핫한 톡');
                            },
                            child: SvgPicture.asset(
                                'assets/icons/icon20/Right.svg')),
                      ),
                      // Test
                      // 핫한 톡
                      CustomTalkWidget(talkModel: controller.talkModels.first),

// 톡톡톡
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            SvgPicture.asset('assets/icons/icon20/fire.svg'),
                            SizedBox(width: 8),
                            Text('톡톡톡', style: AppTypography.tapButtonBold18),
                          ],
                        ),
                        trailing: InkWell(
                            onTap: () {
                              Get.toNamed(ViewRoute.talkDetailPage,
                                  arguments: '톡톡톡');
                            },
                            child: SvgPicture.asset(
                                'assets/icons/icon20/Right.svg')),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.talkModels.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: CustomTalkWidget(
                                talkModel: controller.talkModels[index]),
                          );
                        },
                      )
                    ]),

              //
            )),
      ),
    );
  }
}
