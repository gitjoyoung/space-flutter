import 'package:ace/utils/button.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/space_appbar.dart';
import 'package:ace/widgets/title_appbar_custom.dart';
import 'package:ace/widgets/avatar_custom.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:ace/widgets/mogak_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MogakDetail extends GetView {
  final VoidCallback? onPressed;

  const MogakDetail({Key? key, this.onPressed}) : super(key: key);

  void showCustomDialog() {
    Get.defaultDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "그룹에 참여하시겠습니까?",
          style: AppTypograpy.button36Bold,
        ),
      ),
      confirm: ElevatedButton(
          style: AppButton.small,
          onPressed: () {
            Get.back();
          },
          child: Text('참여하기')),
      cancel: ElevatedButton(
          style: AppButton.small,
          onPressed: () {
            Get.back();
          },
          child: Text('참여하기')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpaceAppBar(),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(8),
        color: Colors.white,
        
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                // 보내기 버튼 동작
              },
            ),
            filled: true,
            fillColor: AppColors.strokeLine05,
            hintText: '댓글을 입력하세요...',
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.neutral50, width: 2.0),
              borderRadius: BorderRadius.circular(12),
            ),
           contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),// 내부 패딩 조정
          ),
        ),
      ),
      body: Column(
        children: [
          TitleAppBarCustom(),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 10, right: 10, bottom: 12),
                child: Column(
                  children: [
                    MogakContent(),
                    SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            children: [
                              AvatarCustom(
                                height: 68,
                                width: 70,
                              ),
                              Text(
                                '마르코',
                                style: AppTypograpy.button28Bold,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showCustomDialog();
                      },
                      child: Text(
                        '참여하기',
                        style: AppTypograpy.tapButtonMedium18,
                      ),
                      style: AppButton.xLarge,
                    ),
                    Container(
                      height: 10,
                    ),
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
                    Expanded(
                      child: ListView(children: [
                        Row(children: [
                          AvatarCustom(
                            height: 68,
                            width: 70,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              '케빈',
                              style: AppTypograpy.button36Bold,
                            ),
                          ),
                          Tag(title: '수료생'),
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: AppColors.strokeLine05,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 24, bottom: 24, left: 16, right: 16),
                            child: Text(
                                style: AppTypograpy.button36Medium,
                                '와 새로운 기능이 정리가 잘 되어있네요! 좋은 정보 공유 감사드립니다! 글을 너무 잘 쓰시는것같아요!'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '1분전',
                              style: AppTypograpy.cardBody
                                  .copyWith(color: AppColors.neutral40),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            SvgPicture.asset('assets/icons/icon20/like.svg'),
                            Text(
                              '16',
                              style: AppTypograpy.cardBody
                                  .copyWith(color: AppColors.prinary80),
                            ),
                          ],
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
