import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:restaurant_pos_app/config/images.dart';
import 'package:restaurant_pos_app/screens/widgets/bg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class SwipeCardScreen extends StatefulWidget {
  const SwipeCardScreen({super.key});

  @override
  State<SwipeCardScreen> createState() => _SwipeCardScreenState();
}

class _SwipeCardScreenState extends State<SwipeCardScreen> {
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
                color: AppColor.white,
                itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/single_order');
                            },
                            child: Text(
                              'Single Order',
                              style: GoogleFonts.inter(),
                            )),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/batch_order');
                            },
                            child: Text(
                              'Batch Order',
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
                    Gap(48.h),
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
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
