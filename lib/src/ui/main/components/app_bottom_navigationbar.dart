import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/enums/enum_bottom_navigation_page.dart';
import 'package:zexonline/src/ui/main/components/bottom_navigation_item.dart';

final bottomHeight = 72 + Get.mediaQuery.padding.bottom;

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      blur: 4,
      width: Get.width,
      height: bottomHeight,
      elevation: 0,
      color: Colors.transparent,
      padding: EdgeInsets.zero,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
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
    );
  }
}
