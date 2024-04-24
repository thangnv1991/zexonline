import 'package:flutter/material.dart';
import 'package:zexonline/src/ui/widgets/common/custom_circular_progress.dart';

class LoadingFullScreen extends StatelessWidget {
  final Widget child;
  final bool loading;
  final Color? backgroundColor;

  const LoadingFullScreen({
    super.key,
    required this.child,
    this.loading = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) async => !loading,
      child: Stack(
        children: <Widget>[
          child,
          loading
              ? GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: backgroundColor ?? Colors.black54,
                    constraints: const BoxConstraints.expand(),
                    child: const Center(child: CustomCircularProgress()),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
