import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:restaurant_pos_app/config/images.dart';
import 'package:restaurant_pos_app/constants.dart';
import 'package:restaurant_pos_app/screens/widgets/bg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/ndef.dart' as ndef;

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_gb_pos_nfc/flutter_gb_pos_nfc.dart';

import 'package:nfc_manager/nfc_manager.dart';

// import 'record-setting/raw_record_setting.dart';
// import 'record-setting/text_record_setting.dart';
// import 'record-setting/uri_record_setting.dart';
import 'package:flutter/foundation.dart';

import 'dart:io' show Platform, sleep;

class SwipeCardScreen extends StatefulWidget {
  const SwipeCardScreen({super.key});

  @override
  State<SwipeCardScreen> createState() => _SwipeCardScreenState();
}

class _SwipeCardScreenState extends State<SwipeCardScreen> {
  late String _cardID = 'hello';
  late String _cardContent;
  TextEditingController testController = TextEditingController();

  @override
  void initState() {
    super.initState();

    cardRead();
  }

  // function to read or listen to the tags
  Future<void> cardRead() async {
    GBPosNfc.readCard().listen((PosNfcData cardInfo) {
      print(cardInfo.id.toString());
      print(cardInfo.content.toString());

      if (cardInfo.id != null && mounted) {
        setState(() {
          _cardID = cardInfo.id.toString();
          _cardContent = cardInfo.content.toString();
          // testController.text = cardInfo.id ?? "-";
        });
      }
    }, onDone: () async {
      // code to restart listening
      await Future.delayed(const Duration(seconds: 1));
      GBPosNfc.start();
      cardRead();
      print('restared');
    });

    // Check availability
//     bool isAvailable = await NfcManager.instance.isAvailable();

//     print(isAvailable);

// // Start Session
    // NfcManager.instance.startSession(
    //   onDiscovered: (NfcTag tag) async {
    //     print(tag.data);

    //     final ndef = Ndef.from(tag);

    //     if (ndef != null) {
    //       final data = await ndef.read();

    //       setState(() {
    //         _cardID = const Utf8Decoder()
    //             .convert(data.records.first.payload)
    //             .substring(3);
    //       });

    //       print('decoded');

    //       return;
    //     }

    //     setState(() {
    //       _cardID = (NfcA.from(tag)?.identifier ??
    //               NfcB.from(tag)?.identifier ??
    //               NfcF.from(tag)?.identifier ??
    //               NfcV.from(tag)?.identifier ??
    //               Uint8List(0))
    //           .toHexString();
    //     });
    //     print('Session started by DRONE');
    //     // Navigator.popAndPushNamed(context, '/login');
    //   },
    // );

// Stop Session
    // NfcManager.instance.stopSession();
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
                              // style: GoogleFonts.inter(),
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
                              // style: GoogleFonts.inter(),
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
                      _cardID.toString(),
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColor.white),
                    ),
                    Text(
                      '',
                      // _tag.toString(),
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
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
                      Constants.CARD_SWIPE,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColor.white),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.pushReplacementNamed(context, '/login');

                        // GBPosNfc.start();
                      },
                      child: Text(
                        Constants.SWIPE_LOGIN,
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
