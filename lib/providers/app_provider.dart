import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  String appStage = "";
  int homepageIndex = 0;
  List<String> appCart = [];
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

  void addAppCart({required String id}) {
    appCart.add(id);
    notifyListeners();
  }

  void removeAppCart({required String id}) {
    appCart.remove(id);
    notifyListeners();
  }

  List<String> getAppCart() {
    return appCart;
  }
}
