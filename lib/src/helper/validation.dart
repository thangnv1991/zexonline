import 'package:flutter/material.dart';
import 'package:zexonline/src/utils/app_constants.dart';

// Validate input
class Validation {
  static String validateEmail(String value) {
    final regex = RegExp(AppConstants.patternEmail);
    if (value.isEmpty) {
      return 'Email không được để trống';
    } else if (!regex.hasMatch(value)) {
      return 'Email không đúng định dạng';
    } else {
      return '';
    }
  }

  // Validate password
  static String validatePassword(String value) {
    final length = value.trim().length;
    if (length == 0) {
      return 'Mật khẩu không được để trống';
    } else if (length < 6) {
      return 'Mật khẩu không được ít hơn 6 ký tự';
    } else {
      return '';
    }
  }

  // Validate Confirm password
  static String? Function(String?) validateConfirmPassword(
      BuildContext context, String confirmPassword) {
    return (value) {
      final length = value?.trim().length ?? 0;
      if (length == 0) {
        return '';
      } else if (confirmPassword.trim().isEmpty) {
        return null;
      } else if (value != confirmPassword) {
        return '';
      } else {
        return null;
      }
    };
  }

  // Validate username
  static String? Function(String?) validateUsername(BuildContext context) {
    return (value) {
      var pattern = r'^[a-zA-Z0-9-_]+$';
      var pattern_2 = r'^(?![_-])[a-zA-Z0-9-_]+$';
      final regExp = RegExp(pattern);
      final regExp_2 = RegExp(pattern_2);
      final length = value?.trim().length ?? 0;
      if (length == 0) {
        return '';
      } else if (length > 15) {
        return '';
      } else if (!regExp.hasMatch(value ?? "")) {
        return '';
      } else if (!regExp_2.hasMatch(value ?? "")) {
        return '';
      }
      return null;
    };
  }
}
