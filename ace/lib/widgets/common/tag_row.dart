import 'package:ace/widgets/common/card_tag.dart';
import 'package:flutter/material.dart';
// 필요한 경우 여기에 Tag 위젯을 임포트해야 합니다.
// 예: import 'package:myapp/widgets/tag.dart';

class TagsRow extends StatelessWidget {
  final String tagsString;

  const TagsRow({
    Key? key,
    required this.tagsString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> tagWidgets = tagsString
        .split('#') // '#' 기준으로 문자열 분리
        .where((tag) => tag.isNotEmpty) // 빈 문자열 제거
        .map((tag) => Tag(title: '#$tag')) // 각
        .toList();

    return Row(
      children: tagWidgets, // 생성된 Tag 위젯들을 Row의 children으로 추가
      mainAxisAlignment: MainAxisAlignment.start, // Row의 시작 부분부터 태그를 나열
      crossAxisAlignment: CrossAxisAlignment.center, // 세로 중앙 정렬
    );
  }
}
