import 'package:ace/models/mogak/badge_model.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BadgeAvatarCustom extends StatelessWidget {
  const BadgeAvatarCustom({
    super.key,
    this.avatarUrl,
    this.height,
    this.width,
    this.badge,
    this.authorBadge,
  });
  final String? avatarUrl;
  final String? badge;
  final BadgeModel? authorBadge;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    double actualHeight = height ?? 48;
    double actualWidth = actualHeight ?? 43; // width를 height의 70%로 계산합니다.

    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: actualHeight,
      width: actualHeight,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: actualWidth,
            height: actualWidth,
            decoration: BoxDecoration(
              color: AppColors.primary5,
              borderRadius: BorderRadius.circular(actualHeight / 2), // 원형 설정s
            ),
            child: Center(
              child: avatarUrl != null && avatarUrl!.contains("https")
                  ? Image.network(
                      avatarUrl!,
                      fit: BoxFit.cover,
                    )
                  : SvgPicture.asset(
                      'assets/icons/icon50/man-a.svg',
                      width: actualHeight * 0.7,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          if (authorBadge?.shortName != null && authorBadge?.shortName != '')
            Positioned(
              bottom: -6,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: AppColors.primary80, // 파란색 배경
                  borderRadius: BorderRadius.circular(5.0), // 라운드 값 설정
                ),
                height: actualHeight * 0.3,
                width: actualWidth,
                child: Center(
                  child: Text(authorBadge!.shortName ?? '배지 없음',
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.cardBody.copyWith(
                        fontSize: actualWidth * 0.2,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
