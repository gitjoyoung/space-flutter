import 'package:ace/controller/home/home_controller.dart';
import 'package:ace/routes/pages.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/space_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: HomeLayOut(),
    initialRoute: ViewRoute.home,
    getPages: AppPages.pages,
  ));
}

class HomeLayOut extends GetView<HomeController> {
  const HomeLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: SpaceAppBar(),
      bottomNavigationBar: Container(
        height: 80,
        child: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

            currentIndex: controller.tabIndex.value, // 현재 선택된 탭의 인덱스
            onTap: (index) {
              controller.changeTabIndex(index); // 탭 변경
              // 페이지 이동 로직을 여기에 추가하세요.
            }, // 탭을 탭했을 때 호출될 메서드
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle:
                AppTypograpy.cardBody.copyWith(color: AppColors.primary80),
            unselectedLabelStyle:
                AppTypograpy.cardBody.copyWith(color: AppColors.neutral60),
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.secondaryColor,
            items: const [
              BottomNavigationBarItem(
                label: '홈',
                icon: ImageIcon(
                  AssetImage('assets/navigation/png/Home.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: '톡!',
                icon: ImageIcon(
                  AssetImage('assets/navigation/png/Community.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: '캐치업!',
                icon: ImageIcon(
                  AssetImage('assets/navigation/png/Work.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: '모각코!',
                icon: ImageIcon(
                  AssetImage('assets/navigation/png/Lounge.png'),
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Image(
                  image: AssetImage('assets/navigation/png/Woman.png'),
                  width: 23,
                  height: 23,
                ),
                label: '마이페이지',
                icon: ImageIcon(
                  AssetImage(
                    'assets/navigation/png/woman-a.png',
                  ),
                  size: 23,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.currentPage),
    );
  }
}
