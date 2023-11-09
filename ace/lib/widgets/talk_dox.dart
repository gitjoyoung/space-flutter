import 'package:ace/utils/colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speech Bubble Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Speech Bubble Example'),
        ),
        body: Center(
          child: SpeechBubble(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('여기에 메시지를 입력하세요'),
            ),
          ),
        ),
      ),
    );
  }
}

class SpeechBubble extends StatelessWidget {
  final Widget child;

  const SpeechBubble({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BubblePainter(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //   color: AppColors.strokeLine10,
          //   width: 1.0,
          // ),
        ),
        child: child,
      ),
    );
  }
}

class BubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = const Color.fromARGB(255, 139, 29, 29);

    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height / 2 - 2);
    path.lineTo(-10, size.height / 2 + 10); // 말풍선 꼬리 부분
    path.lineTo(0, size.height / 2 + 12);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
