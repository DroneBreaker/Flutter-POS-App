import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  String appStage = "";
  int homepageIndex = 0;

  void setHomePageIndex({required int homepageIndex}) {
    this.homepageIndex = homepageIndex;
    notifyListeners();
  }

  void setAppStage({
    required String appStage,
  }) {
    this.appStage = appStage;

    notifyListeners();
  }

  int getHomepageIndex() {
    return homepageIndex;
  }
}
