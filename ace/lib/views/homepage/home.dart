import 'package:ace/controller/home/home_controller.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/views/mogakpage/mogak.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 390,
            height: 157,
            child: Obx(
              () => PageView.builder(
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
          Container(
            margin: EdgeInsets.only(top: 24, bottom: 24),
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
          Text(
            controller.token,
            style: AppTypography.button28Medium,
          ),
        ],
      ),
    );
  }
}
