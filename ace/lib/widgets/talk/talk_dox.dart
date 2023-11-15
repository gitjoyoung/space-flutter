import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

// HeartBubble(
//   text1: "텍스트1",
//   text2: "텍스트2",
//   onTap: () {
//     print("아이콘이 탭되었습니다.");
//   },
// )
class HeartBubble extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback? onTap;

  HeartBubble({
    Key? key,
    required this.text1,
    required this.text2,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 78,
      child: Bubble(
        elevation: 0,
        borderColor: AppColors.neutral10,
        margin: BubbleEdges.only(top: 16),
        stick: true,
        nip: BubbleNip.leftBottom,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(text1,
                        style: AppTypography.cardBody
                            .copyWith(color: AppColors.neutral40)),
                    SizedBox(height: 8),
                    Text(text2,
                        style: AppTypography.button36Medium
                            .copyWith(color: AppColors.neutral100)),
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: onTap,
                child: Icon(Icons.favorite, color: Colors.red, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
