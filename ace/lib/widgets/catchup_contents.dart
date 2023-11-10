import 'package:ace/controller/catch/catch_controller..dart';
import 'package:ace/models/catch/catch_maode2.dart';
import 'package:ace/models/catch/catch_model.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/avatar_custom.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:ace/widgets/tag_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CatchupContent extends GetView<CatchController> {
  const CatchupContent({this.data, this.maxLength, super.key});

  final AllCatchModel? data;
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
                  AvatarCustom(
                    badge: data?.author?.badge?.shortName,
                    avatarUrl: data?.author?.avatar,
                    height: 48,
                    width: 43,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      data?.author?.nickname ?? "닉네임없음",
                      style: AppTypography.button28Bold,
                    ),
                  ),
                  Tag(title: '수료생'),
                ],
              ),
              trailing: InkWell(
                  onTap: () {
                    print('좋아요 클릭');
                    controller.LikeCatch(data?.id ?? "");
                  },
                  child: SvgPicture.asset('assets/icons/icon20/like.svg')),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: RichText(
                  text: TextSpan(
                      style: AppTypography.tapButtonCardTitle16,
                      children: [
                        TextSpan(
                            text: RegExp(r'\[.*?\]')
                                .firstMatch(data?.title ?? "")
                                ?.group(0),
                            style: TextStyle(color: AppColors.primaryColor)),
                        TextSpan(
                            text: (data?.title ?? "")
                                .replaceAll(RegExp(r'\[.*?\]'), ''),
                            style: TextStyle(color: Colors.black)),
                      ]),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                data?.content ?? "",
                style: AppTypography.button36Regular,
                maxLines: maxLength ?? 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 0),
              trailing: Text("2023. 11 .1",
                  style: AppTypography.cardBody.copyWith(
                    color: AppColors.neutral40,
                  )),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TagsRow(
                tagsString: (data?.hashtag?.isEmpty ?? true)
                    ? "#태그없음"
                    : data!.hashtag!, // 태그 리스트를 공백으로 구분된 문자열로 합칩니다.
              ),
            ),
          ]),
    );
  }
}
