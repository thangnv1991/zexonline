import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/enums/enum_option_action.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/options/interactor/options_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/ripple_button.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class OptionItem extends StatelessWidget {
  final OptionAction action;
  final Function()? onTap;

  const OptionItem(
    this.action, {
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RippleButton(
      onTap: onTap,
      backgroundColor: AppColors.transparent,
      borderRadius: 10.borderRadiusAll,
      child: Row(
        children: [
          SvgPicture.asset(
            action.icon,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(AppColors.active, BlendMode.srcIn),
          ),
          12.width,
          Text(
            action.name,
            style: GoogleFonts.cabin(
              fontSize: 16,
              color: AppColors.black,
            ),
          ),
          12.width,
          const Spacer(),
          if (action == OptionAction.Notification)
            BlocBuilder<OptionsBloc, OptionsState>(
                buildWhen: (previous, current) =>
                    previous.enableNotification != current.enableNotification,
                builder: (context, state) {
                  return SizedBox(
                    width: 50,
                    height: 28,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: CupertinoSwitch(
                        value: state.enableNotification,
                        activeColor: AppColors.active,
                        trackColor: AppColors.active,
                        thumbColor: AppColors.inActive,
                        onChanged: (value) =>
                            Get.find<OptionsBloc>().add(UpdateSetting(enableNotification: value)),
                      ),
                    ),
                  );
                }),
        ],
      ),
    );
  }
}
