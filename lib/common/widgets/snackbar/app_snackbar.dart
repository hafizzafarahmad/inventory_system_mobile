import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/style/app_color.dart';

class AppSnackbar {
  static void error(String title, String error) {
    Get.snackbar(title, error,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        backgroundColor: Colors.red[600], colorText: Colors.white);
  }

  static void succes(String title, String error) {

    Get.snackbar(title, error,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  static void warning(String title, String error) {
    Get.snackbar(title, error,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        backgroundColor: AppColor.warning, colorText: Colors.black87);
  }
}
