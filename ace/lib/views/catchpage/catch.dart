import 'package:ace/controller/catch/catch_controller..dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/catch/catch_content.dart';
import 'package:ace/widgets/catch/catch_skeleton.dart';
import 'package:ace/widgets/catch/catch_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Catch extends GetView<CatchController> {
  const Catch({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CatchController());
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller.refreshCatchs(),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, left: 10, right: 10, bottom: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 48,
                  child: TextField(
                    onChanged: (value) {
                      controller.searchText.value = value.trim();
                    },
                    onSubmitted: (value) {
                      controller.searchCatchs();
                    },
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
                Obx(
                  () {
                    final searchResults = controller.searchResults;
                    if (searchResults.isEmpty) {
                      // 검색 결과가 없는 경우
                      return controller.isLoading.value
                          ? CatchSkeleton()
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 80),
                              child: Column(
                                children: [
                                  buildCatchCard(
                                      '핫한 캐치업',
                                      controller.topCatchModels,
                                      ViewRoute.catchlTopListPage),
                                  buildCatchCard(
                                      '캐치업!',
                                      controller.allCatchModels,
                                      ViewRoute.catchlAllListPage),
                                ],
                              ),
                            ); // 빈 위젯 반환하여 아무것도 표시하지 않습니다.
                    } else {
                      // 검색 결과가 있는 경우
                      return Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: ListTile(
                                  title: Text(
                                      '${controller.searchText.value}검색결과',
                                      style: AppTypography.popupTitleMedium),
                                  leading: IconButton(
                                    onPressed: () {},
                                    icon: IconButton(
                                      onPressed: () {
                                        controller.searchText.value = '';
                                        // 뒤로가기 버튼 기능, 예를 들어 Navigator.pop(context);
                                      },
                                      icon: SvgPicture.asset(
                                        'assets/icons/icon20/left.svg',
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              for (final catchs in searchResults)
                                Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: AppColors.strokeLine10,
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: CatchContent(
                                    data: catchs,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
