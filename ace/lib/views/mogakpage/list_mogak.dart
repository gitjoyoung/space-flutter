import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/space_appbar.dart';
import 'package:ace/widgets/title_appbar_custom.dart';
import 'package:ace/widgets/mogak_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MogakList extends StatelessWidget {
  const MogakList({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpaceAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          TitleAppBarCustom(
            title: title,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 17),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    'assets/icons/icon30/Filter.svg',
                    height: 16,
                    width: 16,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    '날자순',
                    style: AppTypograpy.cardBody
                        .copyWith(color: AppColors.primary80),
                  )
                ],
              ),
            ),
          ),
          Card(child: MogakContent()),
          ElevatedButton(
              onPressed: () {
                Get.toNamed(ViewRoute.mogakDetail);
              },
              child: Text('이동'))
        ]),
      ),
    );
  }
}
