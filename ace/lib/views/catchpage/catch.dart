import 'package:ace/controller/auth/auth_controller.dart';
import 'package:ace/controller/catch/catch_controller..dart';
import 'package:ace/models/catch/catch_maode2.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/common/catchup_contents.dart';
import 'package:ace/widgets/common/comment_Icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Catch extends GetView<CatchController> {
  const Catch({super.key});

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
    Get.put(CatchController());
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () => controller.refreshCatchs(),
      child: Padding(
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
              // Obx(
              //   () => !controller.isLoading.value
              //       ? buildSkeleton()
              // :
              Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Row(
                      children: [
                        SvgPicture.asset('assets/icons/icon20/dart.svg'),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '핫한 캐치업',
                          style: AppTypography.tapButtonBold18,
                        ),
                      ],
                    ),
                    trailing: InkWell(
                        onTap: () {
                          // Get.toNamed(ViewRoute.mogakTopListPage);
                        },
                        child:
                            SvgPicture.asset('assets/icons/icon20/Right.svg')),
                  ),
                  // controller.allCatchModels.isEmpty
                  //     ? Container()
                  //     :
                  Card(
                    elevation: 0, // 그림자 제거
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: AppColors.strokeLine10,
                          width: 1.0), // 윤곽선 색과 두께 설정
                      borderRadius: BorderRadius.circular(10), // 윤곽선 둥글기 설정
                    ),
                    child: CatchupContent(
                      // data: AllCatchModel(
                      //     id: "clo2q884r0001la085w99s7zm",
                      //     title: "안드로이드 플러터 앱 release",
                      //     content: "안드로이드 플러터 앱 release.",
                      //     url:
                      //         "https://velog.io/@kw2577/%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C-%ED%94%8C%EB%9F%AC%ED%84%B0-%EC%95%B1-release",
                      //     thumbnail:
                      //         "https://velog.velcdn.com/images/kw2577/post/bc2868ed-b910-40ad-adcd-a1099befc091/image.png",
                      //     authorId: "clo2moojy0001mg08zd57870v",
                      //     temperature: 0,
                      //     status: "PUBLISHED"),
                      maxLength: 3,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // CommentIcon(
                      //   svgIcon: 'assets/icons/icon20/plus.svg',
                      //   count: controller.allCatchModels.first.upProfiles
                      //           ?.length ??
                      //       0,
                      // ),
                      SizedBox(
                        width: 10,
                      ),
                      // CommentIcon(
                      //   svgIcon: 'assets/icons/icon20/like.svg',
                      //   count:
                      //       controller.topCatchModels.first.temperature,
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      print('캐치업');
                      Get.toNamed(ViewRoute.catchlAllListPage);
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/icons/icon20/dart.svg'),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '캐치업!',
                          style: AppTypography.tapButtonBold18,
                        ),
                      ],
                    ),
                    trailing: SvgPicture.asset('assets/icons/icon20/Right.svg'),
                  ),
                  // Obx(
                  //   () => controller.allCatchModels.isEmpty
                  //       ? SizedBox()
                  //       :
                  Card(
                    elevation: 0, // 그림자 제거
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: AppColors.strokeLine10,
                          width: 1.0), // 윤곽선 색과 두께 설정
                      borderRadius: BorderRadius.circular(10), // 윤곽선 둥글기 설정
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        // CommentIcon(
                        //   svgIcon: 'assets/icons/icon20/like.svg',
                        //   count: controller
                        //       .topCatchModels.first.temperature,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              // )
            ],
          ),
        ),
      ),
    ));
  }
}
