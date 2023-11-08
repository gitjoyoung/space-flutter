import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvatarCustom extends StatelessWidget {
  const AvatarCustom({
    super.key,
    this.avatarUrl,
    this.height,
    this.width,
    this.badge,
  });
  final String? avatarUrl;
  final String? badge;

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    double actualHeight = height ?? 48;
    double actualWidth = actualHeight ?? 43; // width를 height의 70%로 계산합니다.

    return Container(
      height: actualHeight,
      width: actualHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (avatarUrl != null && avatarUrl!.contains("https"))
            Image.network(
              avatarUrl!,
              width: actualWidth * 0.8,
              height: actualHeight * 0.6,
              fit: BoxFit.cover, // 이미지 크기를 적절히 조정
            )
          else
            SvgPicture.asset(
              'assets/icons/icon50/man-h.svg',
              width: actualWidth * 0.8,
              height: actualHeight * 0.6,
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue, // 파란색 배경
                borderRadius: BorderRadius.circular(5.0), // 라운드 값 설정
              ),
              height: actualHeight * 0.27,
              width: actualWidth * 0.8,
              child: Center(
                child: Text(badge ?? "개발자/1기",
                    style: TextStyle(
                        fontSize: actualHeight * 0.15, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
