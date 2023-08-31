import 'package:flutter/material.dart';
import 'package:restaurant_pos_app/config/keywords.dart';
import 'package:restaurant_pos_app/models/order.dart';
import 'package:collection/collection.dart';

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
    if (checkDate(date: order.date.toString())) {
      //simplified version of commented codes
      for (var o in orderCart) {
        if (o.date == order.date.toString()) {
          var orderType = order.orders![0].type;
          var existingOrder =
              o.orders!.firstWhereOrNull((el) => el.type == orderType);
          if (existingOrder != null) {
            o.orders!.remove(existingOrder);
          }
          if (orderType != AppKeywords.breakFastSelected) {
            o.orders!
                .removeWhere((rm) => rm.type == AppKeywords.dinnerSelected);
            o.orders!.removeWhere((rm) => rm.type == AppKeywords.lunchSelected);
          }
          o.orders!.add(order.orders![0]);
          break;
        }
      }

      // for (int i = 0; i < orderCart.length; i++) {
      //   var o = orderCart[i];
      //   if (o.date == order.date.toString()) {
      //     var os = o.orders!;
      //     for (int i = 0; i < os.length; i++) {
      //       var el = os[i];

      //       if (el.type == order.orders![0].type) {
      //         o.orders?.removeWhere((rm) => rm.type == order.orders![0].type);
      //         o.orders?.add(order.orders![0]);
      //         break;
      //       } else {
      //         if (order.orders![0].type != AppKeywords.breakFastSelected) {
      //           try {
      //             o.orders?.removeWhere(
      //                 (rm) => rm.type == AppKeywords.dinnerSelected);
      //             o.orders?.removeWhere(
      //                 (rm) => rm.type == AppKeywords.lunchSelected);
      //           } catch (e) {
      //             print(e);
      //           }
      //         }
      //         o.orders?.add(order.orders![0]);
      //         break;
      //       }
      //     }
      //   }
      // }
    } else {
      orderCart.add(order);
    }

    notifyListeners();
  }

  void removeOrder({required String date}) {
    orderCart.removeWhere((o) => o.date == date);
    notifyListeners();
  }

  bool checkDate({required String date}) {
    bool result = false;
    for (var order in orderCart) {
      if (order.date == date) {
        result = true;
        return true;
      }
    }
    return result;
  }

  // void editOrder{}

  List<Order> loadOrder() {
    return orderCart;
  }

  // // Edit an Order object based on its date property
  // orders.forEach((order) {
  //   if (order.date == '2023-07-24') {
  //     order.orders!.add(Orders(type: 'electronics', id: 'E004'));
  //   }
  // });

  // // Delete an Order object based on its date property
  // orders.removeWhere((order) => order.date == '2023-07-25');

  // // Print the updated orders array
  // print(orders);
}
