import 'package:flutter/material.dart';
import 'package:restaurant_pos_app/screens/error.dart';
import 'package:restaurant_pos_app/screens/swipe_card.dart';

import '../screens/breakfast_menu.dart';
import '../screens/dish_period.dart';
import '../screens/home_page.dart';
import '../screens/preferred_dish.dart';

class GenerateRoute {
  //onGenerateRoute init
  static Route? onGenerateRoute(RouteSettings settings) {
    //pagePath
    String? pagePath = settings.name;

    switch (pagePath) {
      case "/":
        return MaterialPageRoute(builder: (_) => const SwipeCardScreen());
      case "/pref_dish_screen":
        return MaterialPageRoute(builder: (_) => const PrefDishScreen());
      case "/dish_period":
        return MaterialPageRoute(builder: (_) => const DishPeriodScreen());
      case "/home_page":
        return MaterialPageRoute(builder: (_) => const HomePage());
      case "/breakfast_menu":
        return MaterialPageRoute(builder: (_) => const BreakfastMenuScreen());
      // BreakfastMenuPage
      case "/ErrorPage":
        return MaterialPageRoute(builder: (_) => const ErrorPage());
      default:
        return MaterialPageRoute(builder: (_) => const SwipeCardScreen());
    }
  }
}
