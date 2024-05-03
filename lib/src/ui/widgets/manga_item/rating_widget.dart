import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/utils/app_assets.dart';

class RatingWidget extends StatelessWidget {
  final double value;
  final double height;
  final bool showText;

  const RatingWidget(this.value, {super.key, this.height = 12, this.showText = false})
      : assert(value >= 0);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...List.generate(
          5,
          (index) => ConstrainedBox(
                constraints: BoxConstraints(maxHeight: height),
                child: SvgPicture.asset(
                  AppAssets.ic_star_svg,
                  // height: height,
                  colorFilter: index < value - 1
                      ? null
                      : const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
              )),
      if (showText)
        Text('$value / 5',
            style: GoogleFonts.cabin(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ))
    ]);
  }
}
