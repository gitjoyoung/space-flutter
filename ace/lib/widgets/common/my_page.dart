import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// myPageCustom(
//   width: 300.0,
//   height: 200.0,
//   headerTitle: '사용자 정의 헤더',
//   svgAssetPath: 'assets/icons/custom_icon.svg',
//   titles: ['내가 쓴 톡', '좋아요 한 톡', '내가 쓴 이어달린 톡'],
// )

class myPageCustom extends StatelessWidget {
  final double width;
  final double height;
  final String headerTitle;
  final String svgAssetPath;
  final List<String> titles;

  const myPageCustom({
    Key? key,
    required this.width,
    required this.height,
    required this.headerTitle,
    required this.svgAssetPath,
    required this.titles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.strokeLine10,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(19),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(svgAssetPath),
                SizedBox(width: 8),
                Text(
                  headerTitle,
                  style: AppTypography.tapButtonBold18,
                ),
              ],
            ),
            SizedBox(height: 20),
            ...titles
                .map((title) => Column(
                      children: [
                        _buildListTile(title, Icons.arrow_forward_ios),
                        DottedDashedLine(
                            axis: Axis.horizontal,
                            height: 0,
                            width: 310,
                            dashColor: AppColors.neutral10),
                      ],
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(String title, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: AppTypography.tapButtonNavgation16
            .copyWith(color: AppColors.neutral80),
      ),
      trailing: Icon(
        icon,
        color: Colors.grey,
        size: 16.0,
      ),
    );
  }
}
