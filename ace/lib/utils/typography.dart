import 'package:flutter/material.dart';

class Typograpy {

// 글자 크기 사전 지정
// 사용 예시
// Text("This is Main Title", style: Typography.mainTitle),

  // 대타이틀 (Main Title)
  static const TextStyle mainTitle = TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // 중간타이틀 (Medium Title)
  static const TextStyle mediumTitle = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // 서브타이틀 (Subtitle)
  static const TextStyle subTitle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  // 소타이틀 (Small Title)
  static const TextStyle smallTitle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  // 미니타이틀 (Mini Title)
  static const TextStyle miniTitle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}
