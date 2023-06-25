import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_pos_app/utils/route.dart';

import 'providers/app_provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Smart Attendance AI',

              // You can use the library anywhere in the app even in theme
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
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}