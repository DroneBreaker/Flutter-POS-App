import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:restaurant_pos_app/config/images.dart';
import 'package:restaurant_pos_app/screens/widgets/bg.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: BgD(),
            child: Container(
              width: double.infinity,
              height: 405.h,
              color: AppColor.PrimaryColor,
            ),
          ),
          // ClipPath(
          //   clipper: BgD(),
          //   child: Container(
          //     width: double.infinity,
          //     height: 351.h,
          //     color: AppColor.white,
          //   ),
          // ),
          SafeArea(
              child: Container(
            padding: EdgeInsets.only(top: 179.h - 54.h),
            width: double.infinity,
            child: Column(children: [
              // Image.asset(
              //   AppImages.verified_icon,
              //   width: 136.w,
              //   height: 138.h,
              // ),
              const SizedBox(
                height: 40,
              ),

              // Success message
              Container(
                height: 360,
                width: 320,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 10))
                    ],
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                      AppImages.verified_icon,
                      width: 76.w,
                      height: 78.h,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Text(
                        'THANK YOU',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800,
                            fontSize: 25.sp,
                            color: Colors.green),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Center(
                        child: Text(
                          'Please wait for your coupon to be printed',
                          style: GoogleFonts.inter(
                              fontSize: 22.sp, color: AppColor.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )),
        ],
      ),
    );
  }
}
