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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true, // 선택된 아이템의 라벨을 보여줄지 여부
        showUnselectedLabels: true, // 선택되지 않은 아이템의 라벨을 보여줄지 여부
        unselectedLabelStyle:
            AppTypograpy.cardBody.copyWith(color: Colors.black),
        selectedItemColor: Colors.blue, // 선택된 아이템의 색상
        unselectedItemColor: Colors.black, // 선택되지 않은 아이템의 색상
        items: [
          BottomNavigationBarItem(
              label: 'home1', icon: Icon(Icons.ac_unit_outlined)),
          BottomNavigationBarItem(
              label: 'talk', icon: Icon(Icons.ac_unit_outlined)),
          BottomNavigationBarItem(
              label: '캐치업!', icon: Icon(Icons.ac_unit_outlined)),
          BottomNavigationBarItem(
              label: '모각코!', icon: Icon(Icons.ac_unit_outlined)),
          BottomNavigationBarItem(
              label: '마이페이지', icon: Icon(Icons.ac_unit_outlined)),
        ],
      ),
      body: Text('data'),
    );
  }
}
