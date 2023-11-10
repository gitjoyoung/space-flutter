import 'package:ace/controller/mogak/mogak_cotroller.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/mogak/mogak_card.dart';
import 'package:ace/widgets/mogak/mogak_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mogak extends GetView<MogakController> {
  const Mogak({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(ViewRoute.mogakCreatePage);
        },
        elevation: 0,
        child: Image.asset('assets/icons/icon30/Write.png'),
        backgroundColor: AppColors.primary80,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refreshMogaks(),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 48,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
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
                  () => controller.isLoading.value
                      ? MogakSkeleton()
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: Column(
                            children: [
                              buildMogakCard(
                                  '핫한 모각코',
                                  controller.topMogakModels,
                                  ViewRoute.mogakTopListPage),
                              buildMogakCard(
                                  '모든 모각코',
                                  controller.allMogakModels,
                                  ViewRoute.mogakAllListPage),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

