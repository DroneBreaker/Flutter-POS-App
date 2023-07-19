import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:restaurant_pos_app/config/images.dart';
import 'package:restaurant_pos_app/screens/widgets/bg.dart';

class AlaCarteMenuScreen extends StatefulWidget {
  const AlaCarteMenuScreen({super.key});

  @override
  State<AlaCarteMenuScreen> createState() => _AlaCarteMenuScreenState();
}

class _AlaCarteMenuScreenState extends State<AlaCarteMenuScreen> {
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
                      "Choose your preferred Option",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColor.white),
                    ),
                    Gap(20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        button1("Starter", AppImages.dinner_icon, () {
                          // Navigator.pushNamed(context, "/dish_period");
                        }, true),
                        Gap(18.h),
                        button1("Main Course", AppImages.carte_icon, () {
                          Navigator.pushNamed(context, "/ala_carte_menu");
                        }, true),
                        Gap(18.h),
                        button1("Dessert", AppImages.carte_icon, () {
                          Navigator.pushNamed(context, "/ala_carte_menu");
                        }, true),
                      ],
                    ),
                    Gap(40.h),
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
