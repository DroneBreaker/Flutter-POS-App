import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colors.dart';

// ignore: non_constant_identifier_names
Widget button1(String title, String Icon, Function() callback,
    [bool check = false, bool submit = false]) {
  return TextButton(
    onPressed: callback,
    style: submit
        ? ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 13, 111, 16)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0))))
        : ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(AppColor.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)))),
    child: SizedBox(
      height: 40.h,
      width: submit
          ? double.infinity
          : check
              ? 159.w
              : 254.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !submit
              ? Image.asset(
                  Icon,
                  width: 36.w,
                  height: 38.h,
                )
              : Container(),
          Gap(10.w),
          Text(
            title,
            style: GoogleFonts.inter(
                fontWeight: submit
                    ? FontWeight.w700
                    : check
                        ? FontWeight.w600
                        : FontWeight.w400,
                fontSize: submit
                    ? 18.sp
                    : check
                        ? 13.sp
                        : 16.sp,
                color: submit ? AppColor.white : AppColor.black),
          ),
        ],
      ),
    ),
  );
}
