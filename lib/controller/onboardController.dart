// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:onboarding/model/models.dart';

class OnboardController extends GetxController {
  var pageController = PageController();
  var selectedPageIndex = 0.obs;
  bool get LastPage =>
      selectedPageIndex.value == OnBoardPageController.length - 1;
  void forward() {
    pageController.nextPage(duration: 200.milliseconds, curve: Curves.ease);
  }

  List<OnboardInfo> OnBoardPageController = [
    OnboardInfo("assets/students.jpg", "Admissions Open!",
        "Admissions open in all classes"),
    OnboardInfo("assets/teacher.jpg", "Best Teachers",
        "We have quilified teachers in our institute"),
    OnboardInfo("assets/success.jpg", "Join us for success in life",
        "Join us from today for success")
  ];
}
