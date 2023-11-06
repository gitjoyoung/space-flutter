import 'package:ace/controller/mogak/mogak_detail_cotroller.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/avatar_custom.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MogakContent extends GetView<MogakDetailController> {
  const MogakContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(left: 0),
              title: Row(
                children: [
                  AvatarCustom(height: 48, width: 43,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '우디',
                      style: AppTypograpy.button28Bold,
                    ),
                  ),
                  Tag(title: '수료생'),
                ],
              ),
              trailing: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset('assets/icons/icon20/like.svg')),
            ),
            InkWell(
              onTap: () {
                print('object 클릭');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: RichText(
                  text: TextSpan(
                      style: AppTypograpy.tapButtonCardTitle16,
                      children: [
                        TextSpan(
                            text: '[모집중] ',
                            style: TextStyle(color: AppColors.primaryColor)),
                        TextSpan(text: '모각코 팀을 모집합니다')
                      ]),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print('object 클릭');
              },
              child: Text(
                '저희는 유니티로 개발을 공부해서 게임 제작을 목표로 하고자합니다. 유니티 3d를 이용해 할 수 있는 간단한 터치 게임부터 ...',
                style: AppTypograpy.button36Regular,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 0),
              trailing: Text('2023.09.04',
                  style: AppTypograpy.cardBody.copyWith(
                    color: AppColors.neutral40,
                  )),
              title: Row(children: [
                SvgPicture.asset(
                  'assets/icons/icon70/man-who.svg',
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 6,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: '3',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold)),
                    TextSpan(text: '/4'),
                    TextSpan(text: '참여')
                  ]),
                ),
              ]),
            ),
            Row(
              children: [
                Tag(title: 'title'),
                Tag(title: 'title'),
              ],
            )
          ]),
    );
  }
}
