import 'package:ace/controller/home/home_controller.dart';
import 'package:ace/controller/mogak/mogak_cotroller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/badge_avatar_custom.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:ace/widgets/comment_Icon.dart';
import 'package:ace/widgets/mogak/mogak_card.dart';
import 'package:ace/widgets/title_appbar_custom.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
            SizedBox(
              width: 390,
              height: 157,
              child: Obx(
                () => PageView.builder(
                  controller: controller.pageController,
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
            Obx(() => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SmoothPageIndicator(
                      axisDirection: Axis.horizontal,
                      controller: controller.pageController, // PageController
                      count: controller.bannerList.length,
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
                )),
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
            topMogak != null
                ? buildMogakCard('핫한 모각코', topMogak, ViewRoute.mogakTopListPage)
                : Text('아직데이타없음'),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Row(
                children: [
                  SvgPicture.asset('assets/icons/icon20/letter.svg'),
                  SizedBox(width: 8),
                  Text('핫한 모각코', style: AppTypography.tapButtonBold18),
                ],
              ),
              trailing: InkWell(
                  onTap: () {
                    Get.toNamed(ViewRoute.mogakTopListPage);
                  },
                  child: SvgPicture.asset('assets/icons/icon20/Right.svg')),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: 165,
                            width: 143,
                            child: Column(children: [
                              SizedBox(height: 16),
                              BadgeAvatarCustom(
                                height: 73,
                                width: 60,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('신디', style: AppTypography.button36Medium),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Tag(title: '수료생')
                                ],
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/icon20/like.svg'),
                                  Text(
                                    '40',
                                    style: AppTypography.cardBody
                                        .copyWith(color: AppColors.primary80),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                          Positioned(
                            top: -17,
                            right: 10,
                            child: SvgPicture.asset('assets/icons/grade/1st.svg'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Text(
              controller.token,
              style: AppTypography.button28Medium,
            ),
          ],
        ),
      ),
    );
  }
}
