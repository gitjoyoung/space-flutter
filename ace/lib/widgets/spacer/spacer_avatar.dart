import 'package:ace/models/home/rank.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/common/badge_avatar_custom.dart';
import 'package:ace/widgets/common/card_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Import necessary dependencies and widgets (BadgeAvatarCustom, Tag, etc.)

class SpacerAvatar extends StatelessWidget {
  final RankModel rankList; // RankListModel을 받을 변수 추가
  final double height;
  final double width;

  const SpacerAvatar({
    Key? key,
    required this.rankList,
    this.height = 200.0, // 높이의 디폴트값을 설정
    this.width = 143.0, // 가로값의 디폴트값을 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: height - 20,
              width: width,
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: AppColors.strokeLine10,
                      width: 1.0), // 윤곽선 색과 두께 설정
                  borderRadius: BorderRadius.circular(10), // 윤곽선 둥글기 설정
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 16),
                      BadgeAvatarCustom(
                        badge: rankList.profile.role,
                        avatarUrl: rankList.profile.avatar,
                        height: height / 3.5,
                        width: width / 0.5,
                      ),
                      Text(
                        rankList.profile.nickname.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTypography.button36Medium,
                      ),
                      Tag(
                        title: rankList.profile.role.toString(),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/icon20/like.svg'),
                          Text(
                            rankList.temperature.toString(),
                            style: AppTypography.cardBody
                                .copyWith(color: AppColors.primary80),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            Positioned(
              top: -17,
              right: 10,
              child: SvgPicture.asset(
                'assets/icons/grade/${rankList.rank}th.svg',
                height: height / 3.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
