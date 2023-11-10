import 'package:ace/controller/mogak/mogak_detail_cotroller.dart';
import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/badge_avatar_custom.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:ace/widgets/tag_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CatchupContent extends GetView<MogakDetailController> {
  const CatchupContent({this.data, this.maxLength, super.key});

  final AllMogakModel? data;
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
                    height: 48,
                    width: 43,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      data?.author?.nickname ?? "",
                      style: AppTypography.button28Bold,
                    ),
                  ),
                  Tag(title: '수료생'),
                ],
              ),
              trailing: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset('assets/icons/icon20/like.svg')),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(ViewRoute.mogakDetailPage, arguments: data?.id);
                print('${data?.id}  제목 클릭');
              },
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
              onTap: () {
                Get.toNamed(ViewRoute.mogakDetailPage, arguments: data?.id);
                print('${data?.id}   내용 클릭');
              },
              child: Text(
                data?.content ?? "",
                style: AppTypography.button36Regular,
                maxLines: maxLength ?? 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 0),
              trailing: Text(
                  data?.createdAt == null
                      ? ""
                      : "${data!.createdAt.year}.${data!.createdAt.month.toString().padLeft(2, '0')}.${data!.createdAt.day.toString().padLeft(2, '0')}",
                  style: AppTypography.cardBody.copyWith(
                    color: AppColors.neutral40,
                  )),
              title: Row(children: [
                SizedBox(
                  width: 6,
                ),
              ]),
            ),
            TagsRow(
              tagsString: (data?.hashtag?.trim().isEmpty ?? true)
                  ? "#태그없음"
                  : data!.hashtag!,
            ),
          ]),
    );
  }
}
