import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:restaurant_pos_app/config/images.dart';
import 'package:restaurant_pos_app/screens/widgets/bg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/ndef.dart' as ndef;

// import 'record-setting/raw_record_setting.dart';
// import 'record-setting/text_record_setting.dart';
// import 'record-setting/uri_record_setting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'dart:async';
import 'dart:io' show Platform, sleep;

class SwipeCardScreen extends StatefulWidget {
  const SwipeCardScreen({super.key});

  @override
  State<SwipeCardScreen> createState() => _SwipeCardScreenState();
}

class _SwipeCardScreenState extends State<SwipeCardScreen>
    with SingleTickerProviderStateMixin {
  String _platformVersion = '';
  NFCAvailability _availability = NFCAvailability.not_supported;
  NFCTag? _tag;
  String? _result, _writeResult;
  late TabController _tabController;
  List<ndef.NDEFRecord>? _records;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (!kIsWeb)
      _platformVersion =
          '${Platform.operatingSystem} ${Platform.operatingSystemVersion}';
    else
      _platformVersion = 'Web';
    initPlatformState();
    _tabController = new TabController(length: 2, vsync: this);
    _records = [];
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    NFCAvailability availability;
    try {
      availability = await FlutterNfcKit.nfcAvailability;
    } on PlatformException {
      availability = NFCAvailability.not_supported;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      // _platformVersion = platformVersion;
      _availability = availability;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            // Popup menu
            PopupMenuButton(
                iconSize: 35,
                icon: const Icon(Icons.menu),
                color: AppColor.black,
                itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/preorder');
                            },
                            child: Text(
                              'Preorder',
                              style: GoogleFonts.inter(),
                            )),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/received_orders');
                            },
                            child: Text(
                              'Received Orders',
                              style: GoogleFonts.inter(),
                            )),
                      ),
                    ]),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            ClipPath(
              clipper: BgD(),
              child: Container(
                width: double.infinity,
                height: 705.h,
                color: AppColor.PrimaryLightColor,
              ),
            ),
            ClipPath(
              clipper: BgD(),
              child: Container(
                width: double.infinity,
                height: 651.h,
                color: AppColor.PrimaryColor,
              ),
            ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.only(top: 229.h - 54.h),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "Hello!",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w800,
                          fontSize: 36.sp,
                          color: AppColor.white),
                    ),
                    Gap(46.h),
                    GestureDetector(
                      onTap: () =>
                          {Navigator.pushNamed(context, "/dish_period")},
                      child: Image.asset(
                        AppImages.qr,
                        width: 136.w,
                        height: 138.h,
                      ),
                    ),
                    Gap(29.h),
                    Text(
                      "Swipe Your Card Here",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColor.white),
                    ),
                    // Text(
                    //   "OR",
                    //   style: GoogleFonts.inter(
                    //       fontWeight: FontWeight.w400,
                    //       fontSize: 16.sp,
                    //       color: AppColor.white),
                    // ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Login Here',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: AppColor.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
