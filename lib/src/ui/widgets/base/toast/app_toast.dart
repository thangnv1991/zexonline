import 'package:flutter/material.dart';
import 'package:zexonline/src/enums/toast_type.dart';
import 'package:zexonline/src/ui/widgets/base/toast/app_toast_title.dart';
import 'package:zexonline/src/utils/app_dimensions.dart';
import 'package:get/get.dart';

void showSuccessToast(String? message) => showToast(message);

void showErrorToast(String? message) => showToast(
      message,
      toastType: ToastType.error,
    );

SnackbarController? showToast(String? message, {ToastType toastType = ToastType.success}) {
  if (message == null || message.isEmpty) return null;
  return Get.rawSnackbar(
    titleText: AppToastTitle(toastType: toastType),
    messageText: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        message,
        style: const TextStyle(color: Colors.black),
      ),
    ),
    backgroundColor: Colors.white,
    borderRadius: 12,
    duration: const Duration(seconds: 3),
    boxShadows: [
      BoxShadow(
        color: Colors.black.withOpacity(.2),
        offset: const Offset(0, AppDimensions.sized4),
        blurRadius: AppDimensions.sized20,
      )
    ],
    snackPosition: SnackPosition.TOP,
    dismissDirection: DismissDirection.horizontal,
    icon: toastType.icon,
    margin: const EdgeInsets.symmetric(horizontal: AppDimensions.sized16).copyWith(
      top: AppDimensions.sized12,
    ),
    padding: const EdgeInsets.all(AppDimensions.sized16).copyWith(left: AppDimensions.sized22),
    animationDuration: const Duration(milliseconds: 500),
  );
}

SnackbarController? showConnectWifi(
  String? message, {
  required bool isConnect,
  Color backgroundColor = Colors.green,
}) {
  if (message == null || message.isEmpty) return null;
  return Get.rawSnackbar(
    message: message,
    backgroundColor: backgroundColor,
    snackPosition: SnackPosition.TOP,
    forwardAnimationCurve: Curves.easeIn,
    reverseAnimationCurve: Curves.easeIn,
    duration: const Duration(seconds: 4),
    animationDuration: const Duration(seconds: 2),
    icon: Icon(
      Icons.wifi,
      color: isConnect ? Colors.green : Colors.black87,
    ),
    isDismissible: false,
  );
}
