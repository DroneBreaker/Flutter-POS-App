import 'package:flutter/material.dart';
import 'package:restaurant_pos_app/screens/swipe_card.dart';

class GenerateRoute {
  //onGenerateRoute init
  static Route? onGenerateRoute(RouteSettings settings) {
    //pagePath
    String? pagePath = settings.name;

    switch (pagePath) {
      case "/":
        return MaterialPageRoute(builder: (_) => const SwipeCardScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SwipeCardScreen());
    }
  }
}
