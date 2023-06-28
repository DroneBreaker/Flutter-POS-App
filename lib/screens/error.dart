import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:restaurant_pos_app/config/images.dart';
import 'package:restaurant_pos_app/screens/widgets/bg.dart';
import 'package:restaurant_pos_app/screens/widgets/bottom_nav.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNav(context),
      body: Stack(
        children: [
          ClipPath(
            clipper: BgD1(),
            child: Container(
              width: double.infinity,
              height: 495.h,
              color: AppColor.PrimaryColor,
            ),
          ),
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
              Gap(
                40.h,
              ),
              Image.asset(
                AppImages.dot,
                width: 73.w,
                height: 73.h,
              ),
              // Success message
              Container(
                height: 310.h,
                width: 330.w,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(36, 117, 117, 117),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 10))
                    ],
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  children: [
                    Gap(40.h),
                    Image.asset(
                      AppImages.access_denied,
                      width: 73.w,
                      height: 73.h,
                    ),
                    Gap(25.h),
                    Center(
                      child: Text(
                        'ACCESS DENIED',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800,
                            fontSize: 24.sp,
                            color: Colors.red.shade600),
                      ),
                    ),
                    Gap(20.h),
                    Text(
                      'Please you don\'t have permission\n to Order, please TRY again',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: AppColor.black,
                      ),
                    ),
                    Gap(25.h),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Go Back',
                          style: GoogleFonts.inter(
                              fontSize: 14.sp, color: Colors.green),
                        ))
                  ],
                ),
              ),
            ]),
          )),
        ],
      ),
    );
  }
  //
}
