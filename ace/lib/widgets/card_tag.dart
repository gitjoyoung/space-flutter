import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({
    super.key,
    required this.title,
  });
  final String title;

// 태그 #태그 위젯  사용법 타이틀만 받아주면 됨
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.background5,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 4.0, bottom: 4, left: 8.0, right: 8.0),
        child: Text(title,
            style: AppTypography.cardBody
                .copyWith(color: AppColors.background100)),
      ),
    );
  }
}
