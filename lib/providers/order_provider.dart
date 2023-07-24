import 'package:flutter/material.dart';
import 'package:restaurant_pos_app/config/keywords.dart';
import 'package:restaurant_pos_app/models/order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> orderCart = [];
  int breakFastSelected = -1;
  int lunchSelected = -1;
  int dinnerSelected = -1;

  void setSelectedFood(
      {required int setSelectedFood, required String category}) {
    switch (category) {
      case AppKeywords.breakFastSelected:
        breakFastSelected != setSelectedFood
            ? breakFastSelected = setSelectedFood
            : breakFastSelected = -1;
        notifyListeners();
        break;
      case AppKeywords.lunchSelected:
        lunchSelected != setSelectedFood
            ? lunchSelected = setSelectedFood
            : lunchSelected = -1;
        notifyListeners();
        break;
      case AppKeywords.dinnerSelected:
        dinnerSelected != setSelectedFood
            ? dinnerSelected = setSelectedFood
            : dinnerSelected = -1;
        notifyListeners();
        break;

      default:
    }

    notifyListeners();
  }

  int getSelectedFood(String category) {
    int selected = -1;
    switch (category) {
      case AppKeywords.breakFastSelected:
        selected = breakFastSelected;
        break;
      case AppKeywords.lunchSelected:
        selected = lunchSelected;
        break;
      case AppKeywords.dinnerSelected:
        selected = dinnerSelected;
        break;

      default:
        selected = -1;
    }
    return selected;
  }

  void foodReset() {
    breakFastSelected = -1;
    lunchSelected = -1;
    dinnerSelected = -1;
    notifyListeners();
  }

  void addOrder({required Order order}) {
    orderCart.add(order);
    notifyListeners();
  }

  void removeOrder({required String orderID}) {
    // orderCart.add(Order);
    notifyListeners();
  }
}
