import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:restaurant_pos_app/config/images.dart';
import 'package:restaurant_pos_app/screens/widgets/bg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: BgD1(),
            child: Container(
              width: double.infinity,
              height: 475.h,
              color: AppColor.PrimaryColor,
            ),
          ),
          SafeArea(
              child: Container(
            padding: EdgeInsets.only(top: 139.h - 54.h),
            width: double.infinity,
            child: Column(children: [
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
                height: 330.h,
                width: 350.w,
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
                    Gap(20.h),
                    Image.asset(
                      AppImages.access_denied,
                      width: 73.w,
                      height: 73.h,
                    ),
                    Gap(20.h),
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
                    Gap(20.h),
                    QrImageView(
                      data: '1234567890',
                      version: QrVersions.auto,
                      size: 100.0,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Go Back',
                          style: GoogleFonts.inter(
                              fontSize: 14.sp, color: Colors.green),
                        )),
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
