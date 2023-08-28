import 'package:flutter/material.dart';
import 'package:restaurant_pos_app/screens/ala_carte_menu.dart';
import 'package:restaurant_pos_app/screens/auth/login.dart';
import 'package:restaurant_pos_app/screens/chinese_dishes.dart';
import 'package:restaurant_pos_app/screens/dinner_menu.dart';
import 'package:restaurant_pos_app/screens/error.dart';
import 'package:restaurant_pos_app/screens/local_dishes.dart';
import 'package:restaurant_pos_app/screens/lunch_menu.dart';
import 'package:restaurant_pos_app/screens/order_type.dart';
import 'package:restaurant_pos_app/screens/preorder/received_orders.dart';
import 'package:restaurant_pos_app/screens/preorder/batch_order.dart';
import 'package:restaurant_pos_app/screens/preorder/food_list.dart';
import 'package:restaurant_pos_app/screens/preorder/pre_order.dart';
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

      // Login page
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      // Preorder page
      case '/preorder':
        return MaterialPageRoute(builder: (_) => const PreOrderScreen());

      // Single order page
      case "/single_order":
        return MaterialPageRoute(builder: (_) => const SingleOrderScreen());

      // Single order page
      case "/batch_order":
        return MaterialPageRoute(builder: (_) => const BatchOrderScreen());

      // Approved order page
      case "/received_orders":
        return MaterialPageRoute(builder: (_) => const ReceivedOrderScreen());

      case "/dish_period":
        return MaterialPageRoute(builder: (_) => const DishPeriodScreen());

      case "/pref_dish_screen":
        return MaterialPageRoute(builder: (_) => const PrefDishScreen());

      case "/home_page":
        return MaterialPageRoute(builder: (_) => const HomePage());

      // case "/test_food":
      //   return MaterialPageRoute(
      //     builder: (_) => FoodMenuScreen(date: settings.arguments),
      //   );
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

      case '/order_type':
        return MaterialPageRoute(builder: (_) => const OrderTypeScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SwipeCardScreen());
    }
  }
}
