import 'package:flutter/material.dart';
import 'package:zexonline/src/enums/enum_library_tab.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/library/component/library_top_navigation_item.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class LibraryTopNavigationBar extends StatelessWidget {
  const LibraryTopNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          borderRadius: 50.borderRadiusAll,
          color: AppColors.black,
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: LibraryTab.values.map((tab) => LibraryTopNavigationItem(tab)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
