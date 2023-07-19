import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_pos_app/config/colors.dart';
import 'package:restaurant_pos_app/config/images.dart';
import 'package:restaurant_pos_app/screens/widgets/bg.dart';
import 'package:restaurant_pos_app/screens/widgets/buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(children: [
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
            padding: EdgeInsets.only(top: 169.h - 54.h),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Gap(40.h),
                  Text(
                    'Login Here',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 25.sp,
                        color: AppColor.white),
                  ),
                  Gap(20.h),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(left: 20),
                        hintText: 'Staff ID',
                        hintStyle: TextStyle(color: AppColor.white)),
                  ),
                  Gap(35.h),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(left: 20),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: AppColor.white)),
                  ),
                  Gap(30.h),
                  button1('Login', AppImages.add, () {
                    return;
                  }, false, true),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
