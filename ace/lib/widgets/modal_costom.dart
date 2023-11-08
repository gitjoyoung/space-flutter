// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ElevatedButton(
//   onPressed: () {
//     // ModalCustom 함수 호출
//     ModalCustom(
//       context,
//       '타이틀',
//       '내용이 여기에 들어갑니다.',
//       Icons.check_circle_outline,
//       Colors.green,
//       '확인',
//       () {
//         // 버튼이 눌렸을 때 할 행동
//         Get.back(); //돌아가기
//       },
//     );
//   },
//   child: Text('모달창 보기'),
// )
void ModalCostom(
    BuildContext context,
    String title,
    String content,
    IconData icon,
    Color iconColor,
    String buttonText,
    VoidCallback onButtonPressed) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 300,
        height: 213,
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 50, color: iconColor),
            SizedBox(height: 7),
            Text(
              title,
              style: AppTypography.tapButtonNavgation16,
            ),
            SizedBox(height: 7),
            Text(
              content,
              style:
                  AppTypography.cardBody.copyWith(color: AppColors.neutral40),
            ),
            SizedBox(height: 17),
            ElevatedButton(
              onPressed: onButtonPressed,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 30), // 세로 10px, 가로 30px 패딩
                child: Text(buttonText, style: AppTypography.button36Regular),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(165, 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
