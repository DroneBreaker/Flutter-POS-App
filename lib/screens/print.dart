// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:restaurant_pos_app/config/colors.dart';

// class PrintScreen extends StatefulWidget {
//   @override
//   _PrintScreenState createState() => _PrintScreenState();
// }

// class _PrintScreenState extends State<PrintScreen> {
//   final List<Map<String, dynamic>> data = [
//     {"title": "Cadbury Dairy Milk", "price": 15, "qty": 2},
//     {"title": "Parle-G Gluco Biscuit", "price": 5, "qty": 5},
//     {"title": "Fresh Onion - 1KG", "price": 20, "qty": 1},
//     {"title": "Fresh Sweet Lime", "price": 20, "qty": 5},
//     {"title": "Maggi", "price": 10, "qty": 5},
//   ];

//   final f = NumberFormat("\$###,###.00", "en_US");
//   BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
//   int _total = 0;
//   _total = data.map((e) => e['price'] * e['qty']).reduce((value, element) => value + element);

//   List<BluetoothDevice> _devices = [];
//   late BluetoothDevice _device;
//   bool _connected = false;
//   late String pathImage;
//   Receipt receipt;

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//     // initSavetoPath();
//     receipt = Receipt();
//   }

//   Future<void> initPlatformState() async {
//     bool? isConnected = await bluetooth.isConnected;
//     List<BluetoothDevice> devices = [];
//     try {
//       devices = await bluetooth.getBondedDevices();
//     } on PlatformException {
//       // TODO - Error
//     }

//     bluetooth.onStateChanged().listen((state) {
//       switch (state) {
//         case BlueThermalPrinter.CONNECTED:
//           setState(() {
//             _connected = true;
//           });
//           break;
//         case BlueThermalPrinter.DISCONNECTED:
//           setState(() {
//             _connected = false;
//           });
//           break;
//         default:
//           print(state);
//           break;
//       }
//     });

//     if (!mounted) return;
//     setState(() {
//       _devices = devices;
//     });

//     if (isConnected!) {
//       setState(() {
//         _connected = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<TeaCollections>(context, listen: false);
//     final deductions = provider.totalDeducts();
//     final net = provider.netWeight();
//     final gross = provider.grossWeight();
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: kUIGradient,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Gap(10.w),
//                     const Text(
//                       'Device : ',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 30,
//                     ),
//                     Gap(30.w),
//                     Expanded(
//                       child: DropdownButton(
//                         items: _getDeviceItems(),
//                         onChanged: (value) => setState(() => _device = value!),
//                         value: _device,
//                         iconSize: 25,
//                         style: GoogleFonts.inter(
//                             fontWeight: FontWeight.w500, color: AppColor.white),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     ElevatedButton(
//                       style: ButtonStyle(backgroundColor: AppColor.white),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                       ),
//                       onPressed: () {
//                         initPlatformState();
//                       },
//                       child: const Text(
//                         'Refresh',
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     ElevatedButton(
//                       style:
//                           ButtonStyle(backgroundColor: AppColor.PrimaryColor),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                       ),

//                       // color: _connected ? Colors.red : Colors.deepPurple,
//                       onPressed: _connected ? _disconnect : _connect,
//                       child: Text(
//                         _connected ? 'Disconnect' : 'Connect',
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
//                   child: ElevatedButton(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25.0),
//                     ),
//                     color: Colors.orange,
//                     onPressed: () {
//                       receipt.sample(
//                           provider.currUser.user_name,
//                           provider.newSupplier.supplierId,
//                           provider.newSupplier.supplierName,
//                           gross,
//                           deductions,
//                           net);
//                       Navigator.pushNamed(context, "MainMenuScreen");
//                     },
//                     child: Text('PRINT',
//                         style: TextStyle(color: Colors.white, fontSize: 30)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
//     List<DropdownMenuItem<BluetoothDevice>> items = [];
//     if (_devices.isEmpty) {
//       items.add(DropdownMenuItem(
//         child: Text('NONE'),
//       ));
//     } else {
//       _devices.forEach((device) {
//         items.add(DropdownMenuItem(
//           child: Text(device.name),
//           value: device,
//         ));
//       });
//     }
//     return items;
//   }

//   void _connect() {
//     if (_device == null) {
//       show('No device selected.');
//     } else {
//       bluetooth.isConnected.then((isConnected) {
//         if (isConnected!) {
//           bluetooth.connect(_device).catchError((error) {
//             setState(() => _connected = false);
//           });
//           setState(() => _connected = true);
//         }
//       });
//     }
//   }

//   void _disconnect() {
//     bluetooth.disconnect();
//     setState(() => _connected = true);
//   }

//   Future show(
//     String message, {
//     Duration duration: const Duration(seconds: 3),
//   }) async {
//     await new Future.delayed(new Duration(milliseconds: 100));
//     Scaffold.of(context).showSnackBar(
//       new SnackBar(
//         content: new Text(
//           message,
//           style: new TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         duration: duration,
//       ),
//     );
//   }
// }

// ignore_for_file: unnecessary_set_literal

// import 'package:bluetooth_print/bluetooth_print.dart';
// import 'package:bluetooth_print/bluetooth_print_model.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class PrintPage extends StatefulWidget {
//   final List<Map<String, dynamic>> data;
//   PrintPage(this.data);

//   @override
//   _PrintPageState createState() => _PrintPageState();
// }

// class _PrintPageState extends State<PrintPage> {
//   BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
//   List<BluetoothDevice> _devices = [];
//   String _devicesMsg = "";
//   final f = NumberFormat("\$###,###.00", "en_US");

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) => {initPrinter()});
//   }

//   Future<void> initPrinter() async {
//     bluetoothPrint.startScan(timeout: const Duration(seconds: 2));

//     if (!mounted) return;
//     bluetoothPrint.scanResults.listen(
//       (val) {
//         if (!mounted) return;
//         setState(() => {_devices = val});
//         if (_devices.isEmpty)
//           setState(() {
//             _devicesMsg = "No Devices";
//           });
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Printer'),
//         backgroundColor: Colors.redAccent,
//       ),
//       body: _devices.isEmpty
//           ? Center(
//               child: Text(_devicesMsg ?? ''),
//             )
//           : ListView.builder(
//               itemCount: _devices.length,
//               itemBuilder: (c, i) {
//                 return ListTile(
//                   leading: Icon(Icons.print),
//                   title: Text(_devices[i].name),
//                   subtitle: Text(_devices[i].address),
//                   onTap: () {
//                     _startPrint(_devices[i]);
//                   },
//                 );
//               },
//             ),
//     );
//   }

//   Future<void> _startPrint(BluetoothDevice device) async {
//     if (device != null && device.address != null) {
//       await bluetoothPrint.connect(device);

//       Map<String, dynamic> config = Map();
//       List<LineText> list = [];

//       list.add(
//         LineText(
//           type: LineText.TYPE_TEXT,
//           content: "Grocery App",
//           weight: 2,
//           width: 2,
//           height: 2,
//           align: LineText.ALIGN_CENTER,
//           linefeed: 1,
//         ),
//       );

//       for (var i = 0; i < widget.data.length; i++) {
//         list.add(
//           LineText(
//             type: LineText.TYPE_TEXT,
//             content: widget.data[i]['title'],
//             weight: 0,
//             align: LineText.ALIGN_LEFT,
//             linefeed: 1,
//           ),
//         );

//         list.add(
//           LineText(
//             type: LineText.TYPE_TEXT,
//             content:
//                 "${f.format(this.widget.data[i]['price'])} x ${this.widget.data[i]['qty']}",
//             align: LineText.ALIGN_LEFT,
//             linefeed: 1,
//           ),
//         );
//       }
//     }
//   }
// }``

// import 'package:blue_thermal_printer_example/testprint.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_pos_app/screens/receipt.dart';
import 'package:nyx_printer/nyx_printer.dart';

class Print extends StatefulWidget {
  @override
  _PrintState createState() => new _PrintState();
}

class _PrintState extends State<Print> {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  List<BluetoothDevice> _devices = [];
  BluetoothDevice? _device;
  bool _connected = false;
  Receipt receipt = Receipt();
  final _nyxPrinterPlugin = NyxPrinter();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // handling printing imagws by nyx_printer
  Future<void> printImage() async {
    final image = await rootBundle.load("images/img.png");
    await _nyxPrinterPlugin.printImage(image.buffer.asUint8List());
  }

  //  handling priniing of text by nyx_printer
  Future<void> printText() async {
    await _nyxPrinterPlugin.printText(
      "Grocery Store",
      textFormat: NyxTextFormat(
        textSize: 32,
        align: NyxAlign.center,
        font: NyxFont.monospace,
        style: NyxFontStyle.boldItalic,
      ),
    );
  }

  // handling generating qr codes
  Future<void> printQrCode() async {
    await _nyxPrinterPlugin.printQrCode(
      "123456789",
      width: 200,
      height: 200,
    );
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Blue Thermal Printer'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(width: 10),
                  const Text(
                    'Device:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: DropdownButton(
                      items: _getDeviceItems(),
                      onChanged: (BluetoothDevice? value) =>
                          setState(() => _device = value),
                      value: _device,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.brown),
                    onPressed: () {
                      initPlatformState();
                    },
                    child: const Text(
                      'Refresh',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: _connected ? Colors.red : Colors.green),
                    onPressed: _connected ? _disconnect : _connect,
                    child: Text(
                      _connected ? 'Disconnect' : 'Connect',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.brown),
                  onPressed: () {
                    receipt.invoice();
                  },
                  child: const Text('PRINT TEST',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devices.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      _devices.forEach((device) {
        items.add(DropdownMenuItem(
          child: Text(device.name ?? ""),
          value: device,
        ));
      });
    }
    return items;
  }

  void _connect() {
    if (_device != null) {
      bluetooth.isConnected.then((isConnected) {
        if (isConnected == false) {
          bluetooth.connect(_device!).catchError((error) {
            setState(() => _connected = false);
          });
          setState(() => _connected = true);
        }
      });
    } else {
      show('No device selected.');
    }
  }

  void _disconnect() {
    bluetooth.disconnect();
    setState(() => _connected = false);
  }

  Future show(
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) async {
    await new Future.delayed(new Duration(milliseconds: 100));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        duration: duration,
      ),
    );
  }
}
