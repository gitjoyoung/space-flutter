import 'package:flutter/material.dart';

class AppTypograpy {
// 글자 크기 사전 지정
// 사용 예시
// Text("This is Main Title", style: Typography.mainTitle),

//HEADING
  // 대타이틀 40 (Main Title)
  static const TextStyle mainTitleFont40 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 40.0,
    height: 48,
    letterSpacing: -3,
    fontWeight: FontWeight.w700,
  );

  // 대타이틀 32(Main Title)
  static const TextStyle mainTitleFont32 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 32.0,
    height: 38,
    letterSpacing: -3,
    fontWeight: FontWeight.w700,
  );

  // 이실장 말풍선
  static const TextStyle leeSpeechBuble = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 28.0,
    height: 34,
    letterSpacing: -3,
    fontWeight: FontWeight.w700,
  );

  // 서브타이틀 24 (Subtitle)
  static const TextStyle subTitleFont24 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 24.0,
    height: 28,
    letterSpacing: -3,
    fontWeight: FontWeight.w700,
  );

  // 서브타이틀 20 (Subtitle)
  static const TextStyle subTitleFont20 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 20.0,
    height: 24,
    letterSpacing: -3,
    fontWeight: FontWeight.w700,
  );

//BODY
  // 팝업 타이틀 w700  (Popup Title)
  static const TextStyle popupTitleBold = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 20.0,
    height: 24,
    letterSpacing: -3,
    fontWeight: FontWeight.w700,
  );

  // 팝업 타이틀 w500 (Popup Title)
  static const TextStyle popupTitleMedium = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 24.0,
    height: 24,
    letterSpacing: -3,
    fontWeight: FontWeight.w500,
  );

  // 팝업 타이틀 w400 (Popup Title)
  static const TextStyle popupTitleRegular = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 20.0,
    height: 24,
    letterSpacing: -3,
    fontWeight: FontWeight.w400,
  );

  // 탭 버튼 - 서브 타이틀 w700 (Tap Button)
  static const TextStyle tapButtonBold18 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 18.0,
    height: 22,
    letterSpacing: -3,
    fontWeight: FontWeight.w700,
  );

  // 탭 버튼 -서브타이틀 w500 (Tap Button)
  static const TextStyle tapButtonMedium18 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 18.0,
    height: 22,
    letterSpacing: -3,
    fontWeight: FontWeight.w500,
  );

  // 탭 버튼 - 본문 w400 (Tap Button)
  static const TextStyle tapButtonRegular18 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 18.0,
    height: 22,
    letterSpacing: -3,
    fontWeight: FontWeight.w400,
  );

  // 탭 버튼 - 카드 티이틀 (Tap Button)
  static const TextStyle tapButtonCardTitle16 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 16.0,
    height: 20,
    letterSpacing: -3,
    fontWeight: FontWeight.w700,
  );

  // 탭 버튼 - 네배게이션 (Tap Button)
  static const TextStyle tapButtonNavgation16 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 16.0,
    height: 20,
    letterSpacing: -3,
    fontWeight: FontWeight.w500,
  );

  // 탭 버튼 - 서브 티이틀 (Tap Button)
  static const TextStyle tapButtonSubtitle16 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 16.0,
    height: 20,
    letterSpacing: -3,
    fontWeight: FontWeight.w400,
  );

  //버튼 36 w700
  static const TextStyle button36Bold = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 14.0,
    height: 18,
    letterSpacing: -3,
    fontWeight: FontWeight.w700,
  );

  //버튼 36 w500
  static const TextStyle button36Medium = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 14.0,
    height: 18,
    letterSpacing: -3,
    fontWeight: FontWeight.w500,
  );

  //버튼 36 w400
  static const TextStyle button36Regular = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 14.0,
    height: 18,
    letterSpacing: -3,
    fontWeight: FontWeight.w400,
  );

  //버튼 28 본문 w700
  static const TextStyle button28Bold = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 12.0,
    height: 16,
    letterSpacing: -3,
    fontWeight: FontWeight.w700,
  );

  //버튼 28 본문 w500
  static const TextStyle button28Medium = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 12.0,
    height: 16,
    letterSpacing: -3,
    fontWeight: FontWeight.w500,
  );

  //버튼 28 카드본문 w400
  static const TextStyle cardBody = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 12.0,
    height: 16,
    letterSpacing: -3,
    fontWeight: FontWeight.w400,
  );
}
