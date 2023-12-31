import 'package:ace/controller/auth/auth_controller.dart';
import 'package:ace/controller/mogak/mogak_cotroller.dart';
import 'package:ace/models/mogak/author_model.dart';
import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/views/mogakpage/test.dart';
import 'package:ace/widgets/common/badge_avatar_custom.dart';
import 'package:ace/widgets/common/card_tag.dart';
import 'package:ace/widgets/common/tag_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MogakContent extends GetView<MogakController> {
  const MogakContent({this.data, this.maxLength, super.key});

  final AllMogakModel? data;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    print('좋아요 누른 리스트' + data!.upProfiles.toString());
    RxBool isLiked = false.obs;
    if (data != null && data!.upProfiles != null) {
      for (var profile in data!.upProfiles!) {
        if (profile['profile']['id'] ==
            Get.find<AuthController>().profileData.value?.id) {
          isLiked.value = true;
          break;
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                  contentPadding: EdgeInsets.only(left: 0),
                  title: Row(
                    children: [
                      BadgeAvatarCustom(
                        authorBadge: data?.author?.badge,
                        avatarUrl: data?.author?.avatar,
                        height: 48,
                        width: 43,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          data?.author?.nickname ??
                              data?.author?.nickname ??
                              "닉네임없음",
                          style: AppTypography.button28Bold,
                        ),
                      ),
                      Tag(
                          title: data?.author?.role ??
                              data?.author?.role ??
                              "역할없음"),
                    ],
                  ),
                  trailing: Obx(
                    () => InkWell(
                      onTap: () {
                        print('좋아요 클릭');
                        controller.fetchLikeModak(data!.id);
                        isLiked.value = !isLiked.value;
                      },
                      child: isLiked.value
                          ? SvgPicture.asset('assets/icons/icon20/like.svg')
                          : SvgPicture.asset('assets/icons/icon20/unLike.svg'),
                    ),
                  )),
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
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
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
        data?.authorId != Get.find<AuthController>().profileData.value?.id
            ? const SizedBox()
            : Positioned(
                bottom: 20,
                right: -5,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(ViewRoute.mogakCreatePage, arguments: data);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/icon20/edit.svg',
                        width: 30,
                        height: 30,
                      ), // 수정
                    ),
                    InkWell(
                        onTap: () {
                          controller.showDeleteDialog(data!.id);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/icon20/deletePost.svg',
                          width: 30,
                          height: 30,
                        )),
                  ],
                ))
      ]),
    );
  }
}
