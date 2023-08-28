import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:restaurant_pos_app/screens/widgets/bg.dart';

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
              padding: EdgeInsets.only(top: 127.h - 54.h),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Choose Your Order Type',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: AppColor.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
