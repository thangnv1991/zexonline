import 'package:flutter/cupertino.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:get/get.dart';

class DialogConfirm extends StatelessWidget {
  final String message;
  final String? textConfirm;
  final String? textCancel;
  final void Function()? onConfirmPressed;
  final void Function()? onCancelPressed;
  final bool hideCancelButton;

  const DialogConfirm(
      {super.key,
      required this.message,
      this.textConfirm,
      this.textCancel,
      this.onConfirmPressed,
      this.onCancelPressed,
      this.hideCancelButton = false});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Text(message, style: const TextStyle(fontSize: 16)),
      ),
      actions: [
        if (!hideCancelButton)
          CupertinoDialogAction(
            onPressed: onCancelPressed ?? () => Get.back(result: false),
            child: Text(textCancel ?? LocaleKey.cancel.tr),
          ),
        CupertinoDialogAction(
          onPressed: onConfirmPressed ?? () => Get.back(result: true),
          child: Text(textConfirm ?? LocaleKey.ok.tr),
        ),
      ],
    );
  }
}
