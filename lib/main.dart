import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_pos_app/providers/order_provider.dart';
import 'package:restaurant_pos_app/utils/route.dart';
import 'package:flutter_gb_pos_nfc/flutter_gb_pos_nfc.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import 'providers/app_provider.dart';

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _cardID;
  TextEditingController testController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> cardRead() async {
    GBPosNfc.readCard().listen((PosNfcData cardInfo) {
      setState(() {
        _cardID = cardInfo.id;
        testController.text = cardInfo.id ?? "-";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 851),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
            providers: [
              Provider<AppProvider>(create: (context) => AppProvider()),
              Provider<OrderProvider>(create: (context) => OrderProvider()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Restuarant App',
              theme: ThemeData(
                primarySwatch: const MaterialColor(0xFFD39E12, {
                  50: Color(0xFFD39E12),
                  100: Color(0xFFD39E12),
                  200: Color(0xFFD39E12),
                  300: Color(0xFFD39E12),
                  400: Color(0xFFD39E12),
                  500: Color(0xFFD39E12),
                  600: Color(0xFFD39E12),
                  700: Color(0xFFD39E12),
                  800: Color(0xFFD39E12),
                  900: Color(0xFFD39E12),
                }),
                textTheme: const TextTheme(
                  displayLarge: TextStyle(color: Colors.black),
                  displayMedium: TextStyle(color: Colors.black),
                  bodyMedium: TextStyle(color: Colors.black),
                  titleMedium: TextStyle(color: Colors.black),
                ),
              ),
              initialRoute: "/",
              onGenerateRoute: GenerateRoute.onGenerateRoute,
            ));
      },
    );
  }
}
