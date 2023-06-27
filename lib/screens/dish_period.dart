import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/colors.dart';
import '../config/images.dart';
import 'widgets/bg.dart';
import 'widgets/buttons.dart';

class DishPeriodScreen extends StatelessWidget {
  const DishPeriodScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      "Choose your preferred Dish",
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
                        Button1("Breakfast", AppImages.breakfast_icon, () {
                          Navigator.pushNamed(context, "/success_page");
                        }, true),
                        Gap(18.w),
                        Button1("Lunch", AppImages.lunch_icon, () {
                          Navigator.pushNamed(context, "/lunch_menu");
                        }, true)
                      ],
                    ),
                    Gap(18.w),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button1("Dinner", AppImages.dinner_icon, () {
                          // Navigator.pushNamed(context, "/dish_period");
                        }, true),
                        Gap(18.w),
                        Button1("Ala Carte", AppImages.carte_icon, () {
                          // Navigator.pushNamed(context, "/dish_period");
                        }, true),
                      ],
                    ),
                    Gap(50.h),
                    Text(
                      "Find the Best Food Around You",
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
