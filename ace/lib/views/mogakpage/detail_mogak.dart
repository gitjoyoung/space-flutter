import 'package:ace/controller/mogak/mogak_detail_cotroller.dart';
import 'package:ace/models/mogak/appliedProfiles_model.dart';
import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/models/mogak/talk_model.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/views/talkpage/talk.dart';
import 'package:ace/widgets/modal_costom.dart';
import 'package:ace/widgets/space_appbar.dart';
import 'package:ace/widgets/title_appbar_custom.dart';
import 'package:ace/widgets/avatar_custom.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:ace/widgets/mogak_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MogakDetail extends GetView<MogakDetailController> {
  final VoidCallback? onPressed;

  const MogakDetail({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AllMogakModel data = Get.arguments as AllMogakModel;

    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: SpaceAppBar(),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(8),
        color: Colors.white,
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            ),
            filled: true,
            fillColor: AppColors.strokeLine05,
            hintText: '댓글을 입력하세요...',
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.neutral50, width: 2.0),
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10), // 내부 패딩 조정
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleAppBarCustom(title: '모각코 상세보기' ),

            // 내용
            Container(
              color: Colors.grey[100],
              child: Padding(
                padding: EdgeInsets.only( bottom: 20),
                child: Column(
                  children: [
                    // 메인내용
                    Card(
                      margin: EdgeInsets.all(0),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            MogakContent(data: data, maxLength: 100),
                            SizedBox(
                              height: 90,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller
                                    .mogakDetail.value?.appliedProfiles?.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        AvatarCustom(
                                          badge: controller.mogakDetail.value
                                              ?.author?.badge?.shortName,
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
                                          style: AppTypograpy.button28Bold,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.showCustomDialog();
                                },
                                child: Text(
                                  '참여하기',
                                  style: AppTypograpy.tapButtonMedium18,
                                ),
                                style: AppButton.xLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      margin: EdgeInsets.all(0),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Row(children: [
                              SvgPicture.asset('assets/icons/icon20/speaker.svg'),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '이어달린 톡',
                                style: AppTypograpy.tapButtonBold18,
                              )
                            ]),
                            SizedBox(
                              height: 16,
                            ),
                            Obx(() {
                              final talks = controller?.mogakDetail?.value?.talks;
                              if (talks == null || talks.isEmpty) {
                                print('댓글 데이타 없음');
                                return Text(
                                    '데이타를 불러오는 중이거나 댓글이 없습니다'); // 혹은 다른 적절한 위젯을 반환하여 렌더링을 하지 않도록 처리
                              }
                              print('댓글 데이타 있음' + talks.toString());
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: talks.length, // 데이터 리스트의 길이
                                itemBuilder: (context, index) {
                                  final TalkModel? item = talks[index];
                      
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          AvatarCustom(
                                            avatarUrl: item!.author.avatar,
                                            badge: item.author.badge?.shortName,
                                            height: 68,
                                            width: 70,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              item!.author
                                                  .nickname, // 데이터에서 이름을 가져와서 표시
                                              style: AppTypograpy.button36Bold,
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
                                          elevation: 0,
                                          color: AppColors.strokeLine05,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Text(
                                              item.content, // 데이터에서 댓글 내용을 가져와서 표시
                                              style: AppTypograpy.button36Medium,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            item!.createdAt
                                                .toString(), // 데이터에서 타임스탬프를 가져와서 표시
                                            style: AppTypograpy.cardBody.copyWith(
                                                color: AppColors.neutral40),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          SvgPicture.asset(
                                              'assets/icons/icon20/like.svg'),
                                          Text(
                                            item.temperature
                                                .toString(), // 데이터에서 좋아요 수를 가져와서 표시
                                            style: AppTypograpy.cardBody.copyWith(
                                                color: AppColors.primary80),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              );
                            }),
                          ],
                        ),
                      ),
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
