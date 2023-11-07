// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommentIcon extends StatelessWidget {
  const CommentIcon({
    Key? key,
    required this.count, required this.svgIcon,
  }) : super(key: key);
  final int count;
  final String svgIcon;
  @override
  Widget build(BuildContext context) {
    final avatarExists = [true, true, true];

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          children: [
            SizedBox(
              width: 40,
              height: 20,
            ),
            for (int i = 0; i < 3; i++)
              if (avatarExists[i])
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
        SvgPicture.asset(svgIcon),
        Text(
          count.toString(),
          style: AppTypograpy.cardBody.copyWith(color: Colors.blue),
        )
      ],
    );
  }
}
