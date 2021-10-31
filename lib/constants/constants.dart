import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constants {
  static Color appColor = Colors.amber[800];
  static String API = 'https://api.mail.tm';

  static const queries = {
    "page": "1",
  };

  static const headers = {
    'Content-Type': 'application/json',
  };
}

void showErrorSnackBar(String e) {
  Get.rawSnackbar(
    snackStyle: SnackStyle.GROUNDED,
    backgroundColor: Colors.red,
    borderRadius: 5,
    messageText: Text(
      e ?? '',
      maxLines: 30,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeInOut,
    barBlur: 20,
    snackPosition: SnackPosition.TOP,
    margin: EdgeInsets.zero,
  );
}

void showSuccessSnackBar(String body) {
  Get.rawSnackbar(
    snackStyle: SnackStyle.GROUNDED,
    backgroundColor: Colors.green,
    snackPosition: SnackPosition.TOP,
    borderRadius: 5,
    messageText: Text(
      body ?? '',
      maxLines: 30,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeInOut,
    barBlur: 20,
    margin: EdgeInsets.zero,
  );
}

extension ExtendedDouble on double {
  Widget get sizedHeight => SizedBox(
        height: this,
      );
  Widget get sizedWidget => SizedBox(
        width: this,
      );
}
