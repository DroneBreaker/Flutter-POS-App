import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colors.dart';

Widget Button1(String title, String Icon, Function() callback) {
  return TextButton(
    onPressed: callback,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColor.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)))),
    child: SizedBox(
      height: 40.h,
      width: 254.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Icon,
            width: 36.w,
            height: 38.h,
          ),
          Gap(10.w),
          Text(
            title,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColor.black),
          ),
        ],
      ),
    ),
  );
}
