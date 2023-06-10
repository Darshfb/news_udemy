import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NewsController extends GetxController {
  final box = GetStorage();

  void changeThemeMode() {
    String? theme = box.read("theme");
    if (theme == null || theme == "dark") {
      Get.changeThemeMode(ThemeMode.light);
      box.write("theme", "light");
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      box.write("theme", "dark");
    }
    update();
  }

  IconData iconTheme() {
    String? theme = box.read("theme");
    if (theme == "dark") {
      return Icons.dark_mode;
    } else {
      return Icons.light_mode;
    }
  }

  int index = 0;

  void changeNavBar({required int currentIndex}) {
    index = currentIndex;
    update();
  }
}
