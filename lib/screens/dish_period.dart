import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_pos_app/constants.dart';
import 'package:restaurant_pos_app/screens/print.dart';
import 'package:nyx_printer/nyx_printer.dart';
import 'package:restaurant_pos_app/screens/receipt.dart';
import 'dart:async';

import '../config/colors.dart';
import '../config/images.dart';
import 'widgets/bg.dart';
import 'widgets/buttons.dart';

class DishPeriodScreen extends StatelessWidget {
  const DishPeriodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _nyxPrinterPlugin = NyxPrinter();

    return Scaffold(
        appBar: null,
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
                padding: EdgeInsets.only(top: 167.h - 54.h),
                width: double.infinity,
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.user_icon,
                      width: 58.w,
                      height: 46.h,
                    ),
                    Gap(40.h),
                    Text(
                      Constants.DISH_PERIOD_INTRO,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColor.white),
                    ),
                    Gap(70.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        button1(
                            Constants.DISH_BREAKFAST, AppImages.breakfast_icon,
                            () {
                          Navigator.pushNamed(context, "/order_type");
                        }, true),
                        Gap(18.w),
                        button1(Constants.DISH_LUNCH, AppImages.lunch_icon, () {
                          Navigator.pushNamed(context, "/order_type");
                        }, true)
                      ],
                    ),
                    Gap(18.w),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        button1(Constants.DISH_DINNER, AppImages.dinner_icon,
                            () {
                          Navigator.pushNamed(context, "/dinner_menu");
                        }, true),
                        Gap(18.w),
                        button1(Constants.DISH_ALA_CARTE, AppImages.carte_icon,
                            () {
                          Navigator.pushNamed(context, "/ala_carte_menu");
                        }, true),
                      ],
                    ),
                    Gap(50.h),
                    ElevatedButton(
                        onPressed: () {
                          // Receipt();
                          // Print();

                          // handling printing imagws by nyx_printer
                          Future<void> printImage() async {
                            final image =
                                await rootBundle.load("images/add.png");
                            await _nyxPrinterPlugin
                                .printImage(image.buffer.asUint8List());
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
                        },
                        child: Text('Print')),
                    Text(
                      Constants.DISH_PERIOD_FOOTER,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColor.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
