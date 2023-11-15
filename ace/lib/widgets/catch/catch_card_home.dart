import 'package:ace/models/catch/catch_model.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/catch/catch_content.dart';
import 'package:ace/widgets/comment_Icon.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Widget buildCatchCardHome(
    String title, RxList<AllCatchModel> catchModels, String route) {
  return Column(
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Row(
          children: [
            SvgPicture.asset('assets/icons/icon20/letter.svg'),
            SizedBox(width: 8),
            Text(title, style: AppTypography.tapButtonBold18),
          ],
        ),
        trailing: InkWell(
            onTap: () {
              Get.toNamed(route);
            },
            child: SvgPicture.asset('assets/icons/icon20/Right.svg')),
      ),
      catchModels.isEmpty
          ? Container()
          : Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.strokeLine10, width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: CatchContent(
                        data: catchModels.first,
                        maxLength: 3,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                        // 이미지를 추가하고 싶다면 아래처럼 사용:
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/profile/rocket.png'), // 이미지 에셋의 경로를 지정
                          fit: BoxFit.cover, // 이미지를 꽉 채우도록 설정
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      )),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
      SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 10),
          CommentIcon(
            svgIcon: 'assets/icons/icon20/like.svg',
            count: catchModels.first.temperature!.toInt(),
          ),
        ],
      ),
      SizedBox(height: 25),
    ],
  );
}

Widget buildCatchCardHome1(
    String title, RxList<AllCatchModel> catchModels, String route) {
  return Column(
    children: [
      Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.strokeLine10, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: CatchContent(
                  data: catchModels[1],
                  maxLength: 3,
                ),
                flex: 2,
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                  // 이미지를 추가하고 싶다면 아래처럼 사용:
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/profile/rocket.png'), // 이미지 에셋의 경로를 지정
                    fit: BoxFit.cover, // 이미지를 꽉 채우도록 설정
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                )),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 10),
          CommentIcon(
            svgIcon: 'assets/icons/icon20/like.svg',
            count: catchModels[1].temperature!.toInt(),
          ),
        ],
      ),
      SizedBox(height: 25),
    ],
  );
}

Widget buildCatchCardHome2(
    String title, RxList<AllCatchModel> catchModels, String route) {
  return Column(
    children: [
      Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.strokeLine10, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: CatchContent(
                  data: catchModels[2],
                  maxLength: 3,
                ),
                flex: 2,
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                  // 이미지를 추가하고 싶다면 아래처럼 사용:
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/profile/rocket.png'), // 이미지 에셋의 경로를 지정
                    fit: BoxFit.cover, // 이미지를 꽉 채우도록 설정
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                )),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 10),
          CommentIcon(
            svgIcon: 'assets/icons/icon20/like.svg',
            count: catchModels[2].temperature!.toInt(),
          ),
        ],
      ),
      SizedBox(height: 25),
    ],
  );
}
