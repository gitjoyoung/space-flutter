import 'package:ace/utils/colors.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;

  FilterButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<FilterButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onTap();
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          isSelected ? AppColors.primary80 : AppColors.neutral60,
        ),
        side: MaterialStateProperty.all(
          isSelected
              ? BorderSide(color: AppColors.primary80)
              : BorderSide(color: Colors.transparent),
        ),
        backgroundColor: MaterialStateProperty.all(AppColors.neutral5),
        minimumSize:
            MaterialStateProperty.all(Size(widget.width, widget.height)),
        elevation: MaterialStateProperty.all(0), // 버튼 크기 설정
      ),
      child: Text(widget.text), // 버튼 텍스트
    );
  }
}
