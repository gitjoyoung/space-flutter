import 'package:ace/controller/mogak/mogak_detail_cotroller.dart';

import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/models/mogak/talk_model.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';

import 'package:ace/widgets/space_appbar.dart';
import 'package:ace/widgets/title_appbar_custom.dart';
import 'package:ace/widgets/badge_avatar_custom.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:ace/widgets/mogak/mogak_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MogakDetail extends GetView<MogakDetailController> {
  final VoidCallback? onPressed;

  const MogakDetail({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              controller.fetchCommentMogak();
            },
            onChanged: (value) {
              print(controller.commentController.text);
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Image.asset('assets/icons/icon20/Send.png'),
                onPressed: () {
                  print('댓글작성 내용 :' + controller.postContent.toString());
                  controller.fetchCommentMogak();
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

      // 메인내용
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleAppBarCustom(title: '모각코 상세보기'),
            Container(
              color: Colors.grey[100],
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Obx(
                      () => Card(
                        margin: EdgeInsets.all(0),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              MogakContent(
                                  data: controller.mogakDetail.value,
                                  maxLength: 100),
                              SizedBox(
                                height: 90,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.mogakDetail.value
                                      ?.appliedProfiles?.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Column(
                                        children: [
                                          BadgeAvatarCustom(
                                            authorBadge: controller
                                                    .mogakDetail
                                                    .value
                                                    ?.appliedProfiles?[index]
                                                    .badge ??
                                                null,
                                            avatarUrl: controller
                                                    .mogakDetail
                                                    .value
                                                    ?.appliedProfiles?[index]
                                                    .avatar ??
                                                null,
                                            height: 68,
                                            width: 70,
                                          ),
                                          Text(
                                            controller
                                                    .mogakDetail
                                                    .value
                                                    ?.appliedProfiles?[index]
                                                    .nickname ??
                                                "",
                                            style: AppTypography.button28Bold,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 25),
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.showCustomDialog(controller.id);
                                  },
                                  child: Text(
                                    '참여하기',
                                    style: AppTypography.tapButtonMedium18,
                                  ),
                                  style: AppButton.xLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    // 댓글 위젯
                    Card(
                      margin: EdgeInsets.all(0),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                          left: 10,
                          top: 30,
                        ),
                        child: Column(
                          children: [
                            Row(children: [
                              SvgPicture.asset(
                                  'assets/icons/icon20/speaker.svg'),
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
                              final talks = controller.mogakDetail.value?.talks;
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
                                  itemCount: talks.length, // 데이터 리스트의 길이
                                  itemBuilder: (context, index) {
                                    final TalkModel? item = talks[index];

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            BadgeAvatarCustom(
                                              authorBadge: controller
                                                  .mogakDetail
                                                  .value
                                                  ?.author
                                                  ?.badge,
                                              avatarUrl: item!.author.avatar,
                                              height: 68,
                                              width: 70,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                item!.author
                                                    .nickname, // 데이터에서 이름을 가져와서 표시
                                                style:
                                                    AppTypography.button36Bold,
                                              ),
                                            ),
                                            Tag(
                                                title: item.author.role
                                                    .toString()), // 데이터에서 태그를 가져와서 표시
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            elevation: 0,
                                            color: AppColors.strokeLine05,
                                            child: Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Text(
                                                item.content, // 데이터에서 댓글 내용을 가져와서 표시
                                                style: AppTypography
                                                    .button36Medium,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              item.createdAt
                                                  .toString(), // 데이터에서 타임스탬프를 가져와서 표시
                                              style: AppTypography.cardBody
                                                  .copyWith(
                                                      color:
                                                          AppColors.neutral40),
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            SvgPicture.asset(
                                                'assets/icons/icon20/like.svg'),
                                            Text(
                                              item.temperature
                                                  .toString(), // 데이터에서 좋아요 수를 가져와서 표시
                                              style: AppTypography.cardBody
                                                  .copyWith(
                                                      color:
                                                          AppColors.primary80),
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
                    SizedBox(
                      height: 150,
                    ),

                    // 댓글 이미지
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
