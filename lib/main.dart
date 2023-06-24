import 'package:flutter/material.dart';
import 'package:restaurant_pos/screens/intro.dart';
import 'package:restaurant_pos/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/menu': (context) => const MenuPage()},
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
          body: Center(
        child: Text('Initialiazed the app'),
      )),
    );
  }
}
