import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:restaurant_pos_app/config/images.dart';
import 'package:restaurant_pos_app/constants.dart';
import 'package:restaurant_pos_app/screens/widgets/bg.dart';
import 'package:restaurant_pos_app/screens/widgets/buttons.dart';

class OrderTypeScreen extends StatefulWidget {
  const OrderTypeScreen({super.key});

  @override
  State<OrderTypeScreen> createState() => _OrderTypeScreenState();
}

class _OrderTypeScreenState extends State<OrderTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text(
                    Constants.ORDER_INTRO,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: AppColor.white),
                  ),
                  Gap(35.h),
                  button1(Constants.ORDER_TAKE_OUT, AppImages.carte_icon, () {
                    Navigator.pushNamed(context, "/success_page");
                  }, true),
                  Gap(20.h),
                  button1(Constants.ORDER_DINE, AppImages.carte_icon, () {
                    Navigator.pushNamed(context, "/success_page");
                  }, true),
                  Gap(110.h),
                  Text(
                    Constants.ORDER_FOOTER,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 17.sp,
                        color: AppColor.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
