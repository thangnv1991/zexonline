import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/enums/enum_bottom_navigation_page.dart';
import 'package:zexonline/src/ui/main/components/bottom_navigation_item.dart';
import 'package:zexonline/src/utils/app_colors.dart';

final bottomHeight = 72 + Get.mediaQuery.padding.bottom;

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: bottomHeight,
        width: Get.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          color: AppColors.black,
        ),
        child: const Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BottomNavigationItem(BottomNavigationPage.Home),
                BottomNavigationItem(BottomNavigationPage.Manga),
                BottomNavigationItem(BottomNavigationPage.Novel),
                BottomNavigationItem(BottomNavigationPage.Library),
                BottomNavigationItem(BottomNavigationPage.Options),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
