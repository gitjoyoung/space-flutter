import 'package:ace/controller/talk/talk_controller.dart';
import 'package:ace/models/mogak/talk_model.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/badge_avatar_custom.dart';
import 'package:ace/widgets/comment_Icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTalkWidget extends GetView<TalkController> {
  final TalkModel talkModel;

  CustomTalkWidget({Key? key, required this.talkModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BadgeAvatarCustom(
                authorBadge: talkModel.author?.badge,
                avatarUrl: talkModel.author?.avatar,
                height: 48,
                width: 43,
              ),
              Text(
                talkModel.author?.nickname ?? "",
                style: AppTypography.button28Bold,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 16, bottom: 18, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            controller.formatTimeDifference(
                                    talkModel.createdAt) ??
                                "",
                            style: AppTypography.cardBody
                                .copyWith(color: AppColors.neutral40)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          talkModel.content,
                          style: AppTypography.button36Medium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommentIcon(
                      svgIcon: 'assets/icons/icon20/Chat2.svg',
                      count: talkModel.temperature,
                    ),
                    SizedBox(width: 10),
                    CommentIcon(
                      svgIcon: 'assets/icons/icon20/like.svg',
                      count: talkModel.temperature,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}