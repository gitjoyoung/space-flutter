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

// 버튼의 높이를 변수로 구분합니다
  static final ButtonStyle xLarge = createButtonStyle(56);
  static final ButtonStyle medium = createButtonStyle(40);
  static final ButtonStyle small = createButtonStyle(32);
  static final ButtonStyle xSmall = createButtonStyle(24);
}
