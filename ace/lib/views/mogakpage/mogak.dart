import 'package:ace/controller/sface/mogak_cotroller.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(
    home: Mogak(),
  ));
}

class Mogak extends GetView<MogakController> {
  const Mogak({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('모각코')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 16, left: 8.0, right: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.strokeLine05, width: 2.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.primaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: '검색',
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.abc),
              onTap: () {
                print('핫한 모각코');
              },
              title: Text('핫한 모각코'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(onTap: () {
                        
                      },
                        contentPadding: EdgeInsets.only(left: 0),
                        title: Row(
                          children: [
                            Icon(Icons.abc_outlined),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('우디'),
                            ),
                            Tag(title: '수료생'),
                          ],
                        ),
                        trailing: Icon(Icons.heart_broken),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: RichText(
                          text: TextSpan(
                              style: AppTypograpy.tapButtonCardTitle16,
                              children: [
                                TextSpan(
                                    text: '[모집중] ',
                                    style: TextStyle(
                                        color: AppColors.primaryColor)),
                                TextSpan(text: '모각코 팀을 모집합니다')
                              ]),
                        ),
                      ),
                      Text(
                        '저희는 유니티로 개발을 공부해서 게임 제작을 목표로 하고자합니다. 유니티 3d를 이용해 할 수 있는 간단한 터치 게임부터 ...',
                        style: AppTypograpy.button36Regular,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 0),
                        trailing: Text('2023.09.04'),
                        title: Row(children: [
                          Icon(Icons.people),
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
                          )
                        ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.abc_outlined),
                          Icon(Icons.abc_outlined),
                          Icon(Icons.abc_outlined),
                        ],
                      ),
                    ]),
              ),
            )
          ],
        ));
  }
}
