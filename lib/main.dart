import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_pos_app/providers/order_provider.dart';
import 'package:restaurant_pos_app/screens/receipt.dart';
import 'package:restaurant_pos_app/utils/route.dart';
// import 'package:flutter_gb_pos_nfc/flutter_gb_pos_nfc.dart';
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
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  List<BluetoothDevice> _devices = [];
  BluetoothDevice? _device;
  bool _connected = false;
  Receipt receipt = Receipt();

  String? _cardID;
  TextEditingController testController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    // TODO here add a permission request using permission_handler
    // if permission is not granted, kzaki's thermal print plugin will ask for location permission
    // which will invariably crash the app even if user agrees so we'd better ask it upfront

    // var statusLocation = Permission.location;
    // if (await statusLocation.isGranted != true) {
    //   await Permission.location.request();
    // }
    // if (await statusLocation.isGranted) {
    // ...
    // } else {
    // showDialogSayingThatThisPermissionIsRequired());
    // }
    bool? isConnected = await bluetooth.isConnected;
    List<BluetoothDevice> devices = [];
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {}

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          setState(() {
            _connected = true;
            print("bluetooth device state: connected");
          });
          break;
        case BlueThermalPrinter.DISCONNECTED:
          setState(() {
            _connected = false;
            print("bluetooth device state: disconnected");
          });
          break;
        case BlueThermalPrinter.DISCONNECT_REQUESTED:
          setState(() {
            _connected = false;
            print("bluetooth device state: disconnect requested");
          });
          break;
        case BlueThermalPrinter.STATE_TURNING_OFF:
          setState(() {
            _connected = false;
            print("bluetooth device state: bluetooth turning off");
          });
          break;
        case BlueThermalPrinter.STATE_OFF:
          setState(() {
            _connected = false;
            print("bluetooth device state: bluetooth off");
          });
          break;
        case BlueThermalPrinter.STATE_ON:
          setState(() {
            _connected = false;
            print("bluetooth device state: bluetooth on");
          });
          break;
        case BlueThermalPrinter.STATE_TURNING_ON:
          setState(() {
            _connected = false;
            print("bluetooth device state: bluetooth turning on");
          });
          break;
        case BlueThermalPrinter.ERROR:
          setState(() {
            _connected = false;
            print("bluetooth device state: error");
          });
          break;
        default:
          print(state);
          break;
      }
    });

    if (!mounted) return;
    setState(() {
      _devices = devices;
    });

    if (isConnected == true) {
      setState(() {
        _connected = true;
      });
    }
  }

  Future<void> cardRead() async {
    // GBPosNfc.readCard().listen((PosNfcData cardInfo) {
    //   setState(() {
    //     _cardID = cardInfo.id;
    //     testController.text = cardInfo.id ?? "-";
    //   });
    // });
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
