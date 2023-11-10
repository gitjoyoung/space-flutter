
import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/comment_Icon.dart';
import 'package:ace/widgets/mogak/mogak_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


Widget buildMogakCard(
    String title, RxList<AllMogakModel> mogakModels, String route) {
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
      mogakModels.isEmpty
          ? Container()
          : Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.strokeLine10, width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: MogakContent(
                data: mogakModels.first,
                maxLength: 3,
              ),
            ),
      SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CommentIcon(
            svgIcon: 'assets/icons/icon20/Chat2.svg',
            count: mogakModels.first.talks!.length,
          ),
          SizedBox(width: 10),
          CommentIcon(
            svgIcon: 'assets/icons/icon20/like.svg',
            count: mogakModels.first.temperature,
          ),
        ],
      ),
      SizedBox(height: 25),
    ],
  );
}