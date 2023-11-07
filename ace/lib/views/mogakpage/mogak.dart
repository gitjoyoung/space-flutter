import 'package:ace/controller/mogak/mogak_cotroller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/comment_Icon.dart';
import 'package:ace/widgets/mogak_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Mogak extends GetView<MogakController> {
  const Mogak({super.key});

  Widget buildSkeleton() => SingleChildScrollView(
        child: Column(
          children: List.generate(
              3,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[100]!),
                            ),
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 230,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[100]!),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  width: 120,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[100]!),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(ViewRoute.mogakCreate);
          },
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          child: SvgPicture.asset(
            'assets/icons/icon50/CatchUp.svg',
            alignment: Alignment.center,
            height: 50,
            width: 50,
          ),
          backgroundColor: AppColors.prinary80,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 48,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(Icons.search),
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
                    ),
                  ),
                ),
                Obx(
                  () => !controller.isLoading.value
                      ? buildSkeleton()
                      : Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/icon20/letter.svg'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '핫한 모각코',
                                    style: AppTypograpy.tapButtonBold18,
                                  ),
                                ],
                              ),
                              trailing: InkWell(
                                  onTap: () {
                                    Get.toNamed(ViewRoute.mogakTopList);
                                  },
                                  child: SvgPicture.asset(
                                      'assets/icons/icon20/Right.svg')),
                            ),
                            controller.allMogakModels.isEmpty
                                ? Container()
                                : Card(
                                    elevation: 0, // 그림자 제거
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: AppColors.strokeLine10,
                                          width: 1.0), // 윤곽선 색과 두께 설정
                                      borderRadius: BorderRadius.circular(
                                          10), // 윤곽선 둥글기 설정
                                    ),
                                    child: MogakContent(
                                      data: controller.allMogakModels.first,
                                      maxLength: 3,
                                    ),
                                  ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CommentIcon(
                                  svgIcon: 'assets/icons/icon20/plus.svg',
                                  count: controller.allMogakModels.first
                                          .appliedProfiles?.length ??
                                      0,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CommentIcon(
                                  svgIcon: 'assets/icons/icon20/like.svg',
                                  count: controller
                                      .allMogakModels.first.temperature,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              onTap: () {
                                print('모든 모각코');
                                Get.toNamed(ViewRoute.mogakAllList);
                              },
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/icon20/letter.svg'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '모든 모각코',
                                    style: AppTypograpy.tapButtonBold18,
                                  ),
                                ],
                              ),
                              trailing: SvgPicture.asset(
                                  'assets/icons/icon20/Right.svg'),
                            ),
                            Obx(() => controller.allMogakModels.isEmpty
                                ? SizedBox()
                                : Card(
                                    elevation: 0, // 그림자 제거
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: AppColors.strokeLine10,
                                          width: 1.0), // 윤곽선 색과 두께 설정
                                      borderRadius: BorderRadius.circular(
                                          10), // 윤곽선 둥글기 설정
                                    ),
                                    child: MogakContent(
                                      data: controller.topMogakModels.first,
                                      maxLength: 3,
                                    ),
                                  )),
                            SizedBox(
                              height: 8,
                            ),
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CommentIcon(
                                    svgIcon: 'assets/icons/icon20/plus.svg',
                                    count: controller.topMogakModels.first
                                            .appliedProfiles?.length ??
                                        0,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CommentIcon(
                                    svgIcon: 'assets/icons/icon20/like.svg',
                                    count: controller
                                        .topMogakModels.first.temperature,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                )
              ],
            ),
          ),
        ));
  }
}
