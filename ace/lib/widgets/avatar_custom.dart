import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvatarCustom extends StatelessWidget {
  const AvatarCustom({
    super.key,
    this.avatarUrl,
    this.height,
    this.width,
  });
  final String? avatarUrl;
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
          SvgPicture.asset(
            'assets/icons/icon50/man-h.svg',
            width: actualWidth * 0.8,
            height: actualHeight *0.6,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/avatar/developer.svg',
              width: actualWidth *0.9,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
