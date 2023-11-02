import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Layout(),
  ));
}

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0; // 현재 선택된 탭의 인덱스

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 선택된 탭의 인덱스를 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          currentIndex: _selectedIndex, // 현재 선택된 탭의 인덱스
          onTap: _onItemTapped, // 탭을 탭했을 때 호출될 메서드
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle:
              AppTypograpy.cardBody.copyWith(color: Colors.black),
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.secondaryColor,
          items: const [
            BottomNavigationBarItem(
              label: '홈',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'talk',
              icon: Icon(Icons.ac_unit_outlined),
            ),
            BottomNavigationBarItem(
              label: '캐치업!',
              icon: Icon(Icons.ac_unit_outlined),
            ),
            BottomNavigationBarItem(
              label: '모각코!',
              icon: Icon(Icons.ac_unit_outlined),
            ),
            BottomNavigationBarItem(
              label: '마이페이지',
              icon: Icon(Icons.ac_unit_outlined),
            ),
          ],
        ),
      ),
      body: Text('data'),
    );
  }
}
