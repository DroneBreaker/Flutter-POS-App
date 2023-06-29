import 'package:flutter/material.dart';
import 'package:restaurant_pos_app/screens/ala_carte_menu.dart';
import 'package:restaurant_pos_app/screens/chinese_dishes.dart';
import 'package:restaurant_pos_app/screens/dinner_menu.dart';
import 'package:restaurant_pos_app/screens/error.dart';
import 'package:restaurant_pos_app/screens/local_dishes.dart';
import 'package:restaurant_pos_app/screens/lunch_menu.dart';
import 'package:restaurant_pos_app/screens/preorder/approved_orders.dart';
import 'package:restaurant_pos_app/screens/preorder/batch_order.dart';
import 'package:restaurant_pos_app/screens/preorder/single_order.dart';
import 'package:restaurant_pos_app/screens/success.dart';
import 'package:restaurant_pos_app/screens/swipe_card.dart';

// import '../screens/breakfast_menu.dart';
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

      // Single order page
      case "/single_order":
        return MaterialPageRoute(builder: (_) => const SingleOrderScreen());

      // Single order page
      case "/batch_order":
        return MaterialPageRoute(builder: (_) => const BatchOrderScreen());

      // Approved order page
      case "/approved_orders":
        return MaterialPageRoute(builder: (_) => const ApprovedOrderScreen());

      case "/dish_period":
        return MaterialPageRoute(builder: (_) => const DishPeriodScreen());

      case "/pref_dish_screen":
        return MaterialPageRoute(builder: (_) => const PrefDishScreen());

      case "/home_page":
        return MaterialPageRoute(builder: (_) => const HomePage());

      // BreakfastMenuPage
      // case "/breakfast_menu":
      // return MaterialPageRoute(builder: (_) => const BreakfastMenuScreen());

      // LunchMenuPage
      case "/lunch_menu":
        return MaterialPageRoute(builder: (_) => const LunchMenuScreen());

      // Dinner menu page
      case "/dinner_menu":
        return MaterialPageRoute(builder: (_) => const DinnerMenuScreen());

      // Ala Carte Menu
      case '/ala_carte_menu':
        return MaterialPageRoute(builder: (_) => const AlaCarteMenuScreen());

      // Chinese Menu
      case '/chinese_dish':
        return MaterialPageRoute(builder: (_) => const ChineseMenuScreen());

      // Local Menu
      case '/local_dish':
        return MaterialPageRoute(builder: (_) => const LocalMenuScreen());

      // Local Menu
      case '/continental_dish':
        return MaterialPageRoute(builder: (_) => const LocalMenuScreen());

      // Success page
      case "/success_page":
        return MaterialPageRoute(builder: (_) => const SuccessPage());

      // Error page
      case "/errorPage":
        return MaterialPageRoute(builder: (_) => const ErrorPage());

      default:
        return MaterialPageRoute(builder: (_) => const SwipeCardScreen());
    }
  }
}
