import 'package:flutter/material.dart';
import 'package:restaurant_pos/widgets/app-text.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Center(
          child: Column(
            children: [
              CircleAvatar(),
              AppText(text: 'Choose Your Preferred Dish', size: 20)
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}
