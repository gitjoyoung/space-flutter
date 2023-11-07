import 'package:ace/controller/mogak/mogak_cotroller.dart';
import 'package:ace/routes/pages.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:ace/widgets/comment_Icon.dart';
import 'package:ace/widgets/mogak_content.dart';
import 'package:ace/widgets/space_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: Mogak(),
    getPages: AppPages.pages,
  ));
}

class Mogak extends GetView<MogakController> {
  const Mogak({super.key});

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
                TextField(
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
                    hintText: '검색',
                  ),
                ),
                ListTile(
                  onTap: () {
                    print('핫한 모각코');
                    Get.toNamed(ViewRoute.mogakList);
                  },
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    children: [
                      SvgPicture.asset('assets/icons/icon20/letter.svg'),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '핫한 모각코',
                        style: AppTypograpy.tapButtonBold18,
                      ),
                    ],
                  ),
                  trailing: SvgPicture.asset('assets/icons/icon20/Right.svg'),
                ),
                Card(
                  child: MogakContent(),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommentIcon(
                      svgIcon: 'assets/icons/icon20/plus.svg',
                      count: 3,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CommentIcon(
                      svgIcon: 'assets/icons/icon20/like.svg',
                      count: 3,
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    print('모든 모각코');
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/icon20/letter.svg'),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '모든 모각코',
                        style: AppTypograpy.tapButtonBold18,
                      ),
                    ],
                  ),
                  trailing: SvgPicture.asset('assets/icons/icon20/Right.svg'),
                ),
                Card(
                  child: MogakContent(),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommentIcon(
                      svgIcon: 'assets/icons/icon20/plus.svg',
                      count: 3,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CommentIcon(
                      svgIcon: 'assets/icons/icon20/like.svg',
                      count: 3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
