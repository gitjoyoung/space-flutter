import 'package:ace/utils/colors.dart';
import 'package:flutter/material.dart';

class AppButton {
  // 버튼을
  const AppButton();

// 각 버튼들의 공통점 radius 설정 이 중복되고 높이값이 달리지기 때문에
// 하나의 버튼스타일로 구성하고 높이값만 받아줍니다
  static ButtonStyle createButtonStyle(double height) {
    return ButtonStyle(
      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)))),
      minimumSize: MaterialStateProperty.all(Size.fromHeight(height)),
    );
  }

  // ElevatedButton에 특화된 스타일 생성

  static ButtonStyle createElevatedButtonStyle(double height, Color backColor,
      [Color? boradColor]) {
    return ElevatedButton.styleFrom(
        side: boradColor != null
            ? BorderSide(color: boradColor)
            : BorderSide.none,
        backgroundColor: backColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        minimumSize: Size.fromHeight(height),
        maximumSize: Size.fromHeight(height));
  }

// Primary
  static final ButtonStyle xLarge =
      createElevatedButtonStyle(56, AppColors.primary80);

  static final ButtonStyle medium =
      createElevatedButtonStyle(40, AppColors.primary80);

  static final ButtonStyle small =
      createElevatedButtonStyle(32, AppColors.primary80);

  static final ButtonStyle xSmall =
      createElevatedButtonStyle(24, AppColors.primary80);

// Outline
  static final ButtonStyle xLargeOutLine = createElevatedButtonStyle(
      56, AppColors.backgroundblue, AppColors.strokeLineBlue);

  static final ButtonStyle mediumOutLine = createElevatedButtonStyle(
      40, AppColors.backgroundblue, AppColors.strokeLineBlue);

  static final ButtonStyle smallOutLine = createElevatedButtonStyle(
      32, AppColors.backgroundblue, AppColors.strokeLineBlue);

  static final ButtonStyle xSmallOutLine = createElevatedButtonStyle(
      24, AppColors.backgroundblue, AppColors.strokeLineBlue);

//Destructiveabled
  static final ButtonStyle xLargeDestructive = createElevatedButtonStyle(
      56, AppColors.systemWarnin, AppColors.systemWarnin);

  static final ButtonStyle mediumDestructive = createElevatedButtonStyle(
      40, AppColors.systemWarnin, AppColors.systemWarnin);

  static final ButtonStyle smallDestructive = createElevatedButtonStyle(
      32, AppColors.systemWarnin, AppColors.systemWarnin);

  static final ButtonStyle xSmallDestructive = createElevatedButtonStyle(
      24, AppColors.systemWarnin, AppColors.systemWarnin);

  //Disabled / Secondary

  static final ButtonStyle xLargeDisabled =
      createElevatedButtonStyle(56, AppColors.neutral5, AppColors.neutral5);

  static final ButtonStyle mediumDisabled =
      createElevatedButtonStyle(40, AppColors.neutral5, AppColors.neutral5);

  static final ButtonStyle smallDisabled =
      createElevatedButtonStyle(32, AppColors.neutral5, AppColors.neutral5);

  static final ButtonStyle xSmallDisabled =
      createElevatedButtonStyle(24, AppColors.neutral5, AppColors.neutral5);
}
