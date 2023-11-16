import 'package:ace/controller/catch/catch_controller..dart';
import 'package:ace/controller/my/my_controller.dart';
import 'package:ace/models/catch/catch_model.dart';

import 'package:ace/models/catch/my_liked_catch_model.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/catch/my_liked_catch_badge.dart';

import 'package:ace/widgets/common/card_tag.dart';
import 'package:ace/widgets/common/tag_row.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyLikedCatchContent extends GetView<MyController> {
  const MyLikedCatchContent({this.data, this.maxLength, super.key});

  final MyLikedCatch? data;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(left: 0),
              title: Row(
                children: [
                  BadgeAvatarCustom(
                    authorBadge: data?.profile?.badge,
                    avatarUrl: data?.profile?.avatar,
                    height: 48,
                    width: 43,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      data?.profile?.nickname ??
                          data?.profile?.nickname ??
                          "닉네임없음",
                      style: AppTypography.button28Bold,
                    ),
                  ),
                  Tag(
                      title:
                          data?.profile?.role ?? data?.profile?.role ?? "역할없음"),
                ],
              ),
              trailing: InkWell(
                  onTap: () {
                    print('좋아요 클릭');
                  },
                  child: SvgPicture.asset('assets/icons/icon20/like.svg')),
            ),
            InkWell(
              onTap: () async => await controller.launchURL(data!.url),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: RichText(
                  text: TextSpan(
                      style: AppTypography.tapButtonCardTitle16,
                      children: [
                        TextSpan(
                            text: RegExp(r'\[.*?\]')
                                .firstMatch(data?.catchUp?.title ?? "")
                                ?.group(0),
                            style: TextStyle(color: AppColors.primaryColor)),
                        TextSpan(
                            text: (data?.catchUp?.title ?? "")
                                .replaceAll(RegExp(r'\[.*?\]'), ''),
                            style: TextStyle(color: Colors.black)),
                      ]),
                ),
              ),
            ),
            // InkWell(
            //   onTap: () async => await controller.launchURL(data!.url),
            //   child: Text(
            //     data?.content ?? "",
            //     style: AppTypography.button36Regular,
            //     maxLines: maxLength ?? 2,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ),

            // 참여인원 날자 표시
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                  data?.createdAt == null
                      ? ""
                      : "${data!.createdAt?.year}.${data!.createdAt?.month.toString().padLeft(2, '0')}.${data!.createdAt?.day.toString().padLeft(2, '0')}",
                  style: AppTypography.cardBody.copyWith(
                    color: AppColors.neutral40,
                  )),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TagsRow(
                tagsString: (data?.catchUp?.hashtag?.trim().isEmpty ?? true)
                    ? "#태그없음"
                    : data!.catchUp!.hashtag!,
              ),
            ),
          ]),
    );
  }
}
