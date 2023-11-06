import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TitleAppBarCustom extends StatelessWidget {
  const TitleAppBarCustom({
    super.key,
    this.title,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 10.0), // 좌우 패딩 설정
      height: 68.0, // 일반적인 앱바의 높이
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 요소들을 양 끝으로 정렬
        children: <Widget>[
          InkWell(
            onTap: () {
              Get.back();
              // 뒤로가기 버튼 기능, 예를 들어 Navigator.pop(context);
            },
            child: SvgPicture.asset('assets/icons/icon20/left.svg' , height: 20, width: 20,),
          ),
          Text(
            title ?? '모각 상세',
            style: AppTypograpy.tapButtonBold18,
          ),
          Opacity(
            opacity: 0, // 오른쪽에 똑같은 공간을 만들기 위해 투명한 아이콘을 넣음
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
