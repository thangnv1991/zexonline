import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/main/components/app_bottom_navigationbar.dart';
import 'package:zexonline/src/ui/widgets/common/custom_circular_progress.dart';
import 'package:zexonline/src/ui/widgets/common/custom_no_data_widget.dart';

class CustomGridView extends StatelessWidget {
  final Axis scrollDirection;
  final int itemCount;
  final Widget? Function(BuildContext context, int index, double heightItem) itemBuilder;
  final Function()? refresh;
  final VoidCallback? loadMore;
  final bool isLoadMore;
  final int crossAxisCount;
  final double axisSpacing;
  final double itemRatio;
  final int spaceHorizontal;
  final ScrollPhysics? scrollPhysics;

  const CustomGridView({
    super.key,
    this.scrollDirection = Axis.vertical,
    required this.itemCount,
    required this.itemBuilder,
    this.refresh,
    this.loadMore,
    this.isLoadMore = false,
    this.crossAxisCount = 2,
    this.axisSpacing = 6,
    this.itemRatio = 1.6,
    this.spaceHorizontal = 10,
    this.scrollPhysics = const NeverScrollableScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    final double heightItem =
        ((Get.width - (spaceHorizontal * 2 + axisSpacing)) / (crossAxisCount * itemRatio)) +
            axisSpacing;
    final rows = ((isLoadMore ? itemCount + 1 : itemCount) / crossAxisCount).ceil();
    final double heightWidget = heightItem * rows;
    return NotificationListener(
      onNotification: (ScrollNotification scrollNotification) {
        if (scrollNotification.metrics.pixels >= scrollNotification.metrics.maxScrollExtent / 2) {
          if (!isLoadMore) loadMore?.call();
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: () async {
          refresh?.call();
        },
        child: Stack(
          children: [
            if (itemCount == 0 && !isLoadMore)
              Padding(
                padding: EdgeInsets.only(bottom: bottomHeight),
                child: const CustomNoDataWidget(),
              ),
            SizedBox(
              height: scrollPhysics == const NeverScrollableScrollPhysics() ? heightWidget : null,
              child: GridView.builder(
                padding: spaceHorizontal.paddingHorizontal,
                itemCount: isLoadMore && itemCount != 0 ? itemCount + 1 : itemCount,
                physics: scrollPhysics,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: axisSpacing,
                  crossAxisSpacing: axisSpacing,
                  childAspectRatio: itemRatio,
                ),
                itemBuilder: (context, index) {
                  if (index == itemCount) {
                    return const CustomLoadMore();
                  }
                  return itemBuilder(context, index, heightWidget);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomLoadMore extends StatelessWidget {
  const CustomLoadMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white70, borderRadius: 8.borderRadiusAll),
      child: const Center(
        child: SizedBox(
          width: 12,
          height: 12,
          child: CustomCircularProgress(
            color: Color(0xFF4C34AC),
          ),
        ),
      ),
    );
  }
}
