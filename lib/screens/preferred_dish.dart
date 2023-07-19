import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/colors.dart';
import '../config/images.dart';
import 'widgets/bg.dart';
import 'widgets/buttons.dart';

class PrefDishScreen extends StatelessWidget {
  const PrefDishScreen({super.key});

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
                padding: EdgeInsets.only(top: 219.h - 54.h),
                width: double.infinity,
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.user_icon,
                      width: 58.w,
                      height: 46.h,
                    ),
                    Gap(29.h),
                    Text(
                      "Choose your preferred Dish",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColor.white),
                    ),
                    Gap(25.h),
                    button1("Chinese Dishes", AppImages.local_icon, () {
                      Navigator.pushNamed(context, "/dish_period");
                    }),
                    Gap(30.h),
                    button1("Local Dishes", AppImages.local_icon, () {
                      Navigator.pushNamed(context, "/dish_period");
                    }),
                    Gap(30.h),
                    button1("Continental Dishes", AppImages.continental_icon,
                        () {
                      // Navigator.pushNamed(context, '/ala_carte_menu');
                    }),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
