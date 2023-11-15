import 'package:ace/controller/talk/talk_detail_controller.dart';
import 'package:ace/models/talk/talk_detail_model.dart';
import 'package:ace/models/talk/talk_model.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/badge_avatar_custom.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:ace/widgets/space_appbar.dart';
import 'package:ace/widgets/talk/talk_content.dart';
import 'package:ace/widgets/talk/talk_skeleton.dart';
import 'package:ace/widgets/title_appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TalkDetail extends GetView<TalkDetailController> {
  const TalkDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpaceAppBar(),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller.commentController,
            onSubmitted: (value) {
              print('댓글작성 내용 :' + value);
              controller.fetchCommentTalk();
            },
            onChanged: (value) {
              print(controller.commentController.text);
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Image.asset('assets/icons/icon20/Send.png'),
                onPressed: () {
                  print('댓글작성 내용 :' + controller.commentController.text);
                  controller.fetchCommentTalk();
                },
              ),
              filled: true,
              fillColor: AppColors.strokeLine05,
              hintText: '댓글을 입력하세요...',
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none, // 테두리 없애기
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none, // 테두리 없애기
                borderRadius: BorderRadius.circular(12),
              ),

              contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10), // 내부 패딩 조정
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          TitleAppBarCustom(title: '톡 상세보기'),
          Obx(() {
            final talkModel = controller.talkDetail.value; // Rx 변수에서 값을 가져옴
            if (talkModel != null) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomTalkWidget(talkModel: talkModel),
              );
            } else {
              return TalkSkeleton(); // 또는 다른 로딩 UI
            }
          }),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 150),
            child: Card(
              margin: EdgeInsets.all(0),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                  top: 15,
                ),
                child: Column(
                  children: [
                    Row(children: [
                      SvgPicture.asset('assets/icons/icon20/speaker.svg'),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '이어달린 톡',
                        style: AppTypography.tapButtonBold18,
                      )
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    Obx(() {
                      final List<TalkModel>? talks =
                          controller.talkDetailWithComment.value.children;
                      if (talks == null || talks.isEmpty) {
                        return SizedBox(
                          height: 100,
                          child: Center(child: Text('댓글이 없습니다!')),
                        ); // 혹은 다른 적절한 위젯을 반환하여 렌더링을 하지 않도록 처리
                      }
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: talks!.length, // 데이터 리스트의 길이
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    BadgeAvatarCustom(
                                      authorBadge: controller
                                          .talkDetail.value?.author!.badge,
                                      avatarUrl: talks[index].author?.avatar,
                                      height: 68,
                                      width: 70,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        talks[index]!
                                            .author!
                                            .nickname, // 데이터에서 이름을 가져와서 표시
                                        style: AppTypography.button36Bold,
                                      ),
                                    ),
                                    Tag(
                                        title: talks[index]
                                            .author!
                                            .role
                                            .toString()), // 데이터에서 태그를 가져와서 표시
                                  ],
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 0,
                                    color: AppColors.strokeLine05,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        talks[index].content.toString(),
                                        style: AppTypography.button36Medium,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      controller.formatTimeDifference(
                                          talks[index].createdAt),
                                      style: AppTypography.cardBody
                                          .copyWith(color: AppColors.neutral40),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    SvgPicture.asset(
                                        'assets/icons/icon20/like.svg'),
                                    Text(
                                      talks[index]
                                          .temperature
                                          .toString(), // 데이터에서 좋아요 수를 가져와서 표시
                                      style: AppTypography.cardBody
                                          .copyWith(color: AppColors.primary80),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
