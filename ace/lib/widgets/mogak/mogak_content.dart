import 'package:ace/controller/mogak/mogak_cotroller.dart';
import 'package:ace/models/mogak/author_model.dart';
import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/views/mogakpage/test.dart';
import 'package:ace/widgets/avatar_custom.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:ace/widgets/tag_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MogakContent extends GetView<MogakController> {
  const MogakContent( {this.data, this.maxLength, this.author, super.key});

  final AllMogakModel? data;
  final int? maxLength;
  final Author? author;

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
                      author?.nickname ?? data?.author?.nickname ?? "닉네임없음",
                      style: AppTypography.button28Bold,
                    ),
                  ),
                  Tag(title: author?.role ?? data?.author?.role ?? "역할없음"),
                ],
              ),
              trailing: InkWell(
                  onTap: () {
                    print('좋아요 클릭');
                    controller.fetchLikeModak(data!.id);
                  },
                  child: SvgPicture.asset('assets/icons/icon20/like.svg')),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(ViewRoute.mogakDetailPage, arguments: data);
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
                Get.toNamed(ViewRoute.mogakDetailPage, arguments: data);
                print('${data?.id}   내용 클릭');
              },
              child: Text(
                data?.content ?? "",
                style: AppTypography.button36Regular,
                maxLines: maxLength ?? 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // 참여인원 날자 표시
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
                SvgPicture.asset(
                  'assets/icons/icon70/man-who.svg',
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 6,
                ),
                RichText(
                  text: TextSpan(style: AppTypography.cardBody, children: [
                    TextSpan(
                        text: data?.appliedProfiles?.length.toString() ?? "0",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '/',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: data?.maxMember.toString() ?? "",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: ' 참여', style: TextStyle(color: Colors.black)),
                  ]),
                ),
              ]),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TagsRow(
                tagsString: (data?.hashtag?.trim().isEmpty ?? true)
                    ? "#태그없음"
                    : data!.hashtag!,
              ),
            ),
          ]),
    );
  }
}
