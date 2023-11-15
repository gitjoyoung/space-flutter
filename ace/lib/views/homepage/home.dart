import 'package:ace/controller/home/home_controller.dart';
import 'package:ace/controller/mogak/mogak_cotroller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/badge_avatar_custom.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:ace/widgets/mogak/mogak_card.dart';
import 'package:ace/widgets/mogak/mogak_skeleton.dart';
import 'package:ace/widgets/spacer/spacer_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var topMogak = Get.find<MogakController>().topMogakList;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 배너
            SizedBox(
              width: 390,
              height: 157,
              child: Obx(
                () => PageView.builder(
                  controller: controller.bannerPageController,
                  itemCount: controller.bannerList.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      controller.bannerList![index].thumbnail.toString(),
                      width: 390,
                      height: 157,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),

            // 배너 인덱스
            Obx(() => controller.bannerList != null &&
                    controller.bannerList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SmoothPageIndicator(
                        axisDirection: Axis.horizontal,
                        controller:
                            controller.bannerPageController, // PageController
                        count: controller.bannerList.length ?? 0,
                        effect: const SlideEffect(
                            spacing: 8.0,
                            radius: 16,
                            dotWidth: 6.0,
                            dotHeight: 6.0,
                            paintStyle: PaintingStyle.fill,
                            strokeWidth: 1.5,
                            dotColor: AppColors.neutral20,
                            activeDotColor:
                                AppColors.primary80), // your preferred effect
                        onDotClicked: (index) {}),
                  )
                : Container()),

// 검색 바
            Container(
              margin: EdgeInsets.only(bottom: 24),
              height: 48,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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

// 테스트 버튼
            // ElevatedButton(
            //     onPressed: () {
            //       controller.fetchListRank();
            //     },
            //     child: Text('데이타 테스트 버튼')),

// 모각 리스트

            Obx(
              () => topMogak != null && topMogak.isNotEmpty
                  ? buildMogakCard(
                      '핫한 모각코', topMogak, ViewRoute.mogakTopListPage)
                  : MogakSkeleton(repeatCount: 1),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Row(
                children: [
                  SvgPicture.asset('assets/icons/icon20/laptop.svg'),
                  SizedBox(width: 8),
                  Text('이달의 스페이서', style: AppTypography.tapButtonBold18),
                ],
              ),
              trailing: InkWell(
                  onTap: () {
                    Get.toNamed(ViewRoute.spacerPage);
                  },
                  child: SvgPicture.asset('assets/icons/icon20/Right.svg')),
            ),

            // 스페이서

            Obx(
              () => controller.rankList == null || controller.rankList.isEmpty
                  ? SpacerSkeleton()
                  : Column(
                      children: [
                        Container(
                          height: 200,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            controller: controller.rankPageController,
                            itemCount: controller.rankList.length,
                            pageSnapping: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: 200,
                                  width: 143,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          height: 180,
                                          width: 143,
                                          child: Column(children: [
                                            SizedBox(height: 16),
                                            BadgeAvatarCustom(
                                              badge: controller
                                                  .rankList[index].profile.role,
                                              avatarUrl: controller
                                                  .rankList[index]
                                                  .profile
                                                  .avatar,
                                              height: 73,
                                              width: 60,
                                            ),
                                            Text(
                                              controller.rankList[index].profile
                                                  .nickname
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                                  AppTypography.button36Medium,
                                            ),
                                            Tag(
                                              title: controller
                                                  .rankList[index].profile.role
                                                  .toString(),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/icon20/like.svg'),
                                                Text(
                                                  controller.rankList[index]
                                                      .temperature
                                                      .toString(),
                                                  style: AppTypography.cardBody
                                                      .copyWith(
                                                          color: AppColors
                                                              .primary80),
                                                ),
                                              ],
                                            ),
                                          ]),
                                        ),
                                        Positioned(
                                          top: -17,
                                          right: 10,
                                          child: SvgPicture.asset(
                                              'assets/icons/grade/${controller.rankList[index].rank}th.svg'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        if (controller.rankList != null &&
                            controller.rankList.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SmoothPageIndicator(
                                axisDirection: Axis.horizontal,
                                controller: controller
                                    .rankPageController, // PageController
                                count: controller.bannerList.length,
                                effect: const SlideEffect(
                                    spacing: 8.0,
                                    radius: 16,
                                    dotWidth: 6.0,
                                    dotHeight: 6.0,
                                    paintStyle: PaintingStyle.fill,
                                    strokeWidth: 1.5,
                                    dotColor: AppColors.neutral20,
                                    activeDotColor: AppColors.primary80),
                                onDotClicked: (index) {}),
                          ),
                      ],
                    ),
            ),
            // 스페이서 인덱스
          ],
        ),
      ),
    );
  }
}
