import 'package:flutter/material.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/widgets/common/custom_circular_progress.dart';

class CustomListView extends StatelessWidget {
  final EdgeInsets? padding;
  final Axis scrollDirection;
  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final Function()? refresh;
  final VoidCallback? loadMore;
  final bool isLoadMore;

  const CustomListView({
    super.key,
    this.padding,
    this.scrollDirection = Axis.vertical,
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.refresh,
    this.loadMore,
    this.isLoadMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => refresh?.call(),
      child: NotificationListener(
        onNotification: (ScrollNotification scrollNotification) {
          if (scrollNotification.metrics.pixels >= scrollNotification.metrics.maxScrollExtent / 2) {
            if (!isLoadMore) loadMore?.call();
          }
          return true;
        },
        child: Stack(
          children: [
            ListView.separated(
              padding: padding,
              scrollDirection: scrollDirection,
              itemCount: itemCount,
              separatorBuilder: separatorBuilder,
              itemBuilder: (BuildContext context, int index) {
                return itemBuilder(context, index);
              },
            ),
            isLoadMore
                ? scrollDirection == Axis.vertical
                    ? Align(alignment: Alignment.bottomCenter, child: _buildLoading())
                    : Align(alignment: Alignment.centerRight, child: _buildLoading())
                : const SizedBox()
          ],
        ),
      ),
    );
    // return CustomRefreshIndicator(
    //   onRefresh: () => refresh?.call(),
    //   autoRebuild: false,
    //   builder: (BuildContext context, Widget child, IndicatorController controller) {
    //     return SvgPicture.asset(AppAssets.ic_arrow_after_svg);
    //   },
    //   child: ListView.separated(
    //     padding: padding,
    //     scrollDirection: scrollDirection,
    //     itemCount: itemCount,
    //     separatorBuilder: separatorBuilder,
    //     itemBuilder: (BuildContext context, int index) {
    //       return itemBuilder(context, index);
    //     },
    //   ),
    // );
  }

  Widget _buildLoading() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: Colors.white70, borderRadius: 8.borderRadiusAll),
      child: const Center(
          child: SizedBox(
              width: 12,
              height: 12,
              child: CustomCircularProgress(
                color: Color(0xFF4C34AC),
              ))),
    );
  }
}
