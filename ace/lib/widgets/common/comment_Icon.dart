// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// 댓글 아이콘 및
class CommentIcon extends StatelessWidget {
  const CommentIcon({
    Key? key,
    required this.count,
    required this.svgIcon,
  }) : super(key: key);
  final int count;
  final String svgIcon;
  @override
  Widget build(BuildContext context) {
    final int displayCount = count.clamp(0, 3); // 0과 3 사이의 값을 갖도록 제한
    final double boxWidth = 20 + (displayCount - 1) * 10; // 가로 사이즈 계산

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          children: [
            SizedBox(width: boxWidth, height: 20), // 동적으로 계산된 가로 사이즈
            // 아이콘들을 겹치게 배치
            for (int i = 0; i < displayCount; i++)
              Positioned(
                left: i * 10,
                child: SvgPicture.asset(
                  "assets/icons/icon50/man-a.svg",
                  width: 20,
                  height: 20,
                ),
              ),
          ],
        ),
        SizedBox(
          width: 1,
        ),
        SvgPicture.asset(
          svgIcon,
          height: 16,
        ),
        Text(
          count.toString(),
          style: AppTypography.cardBody.copyWith(color: Colors.blue),
        )
      ],
    );
  }
}
