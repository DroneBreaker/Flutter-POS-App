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
  String _selectedStarter = 'Please choose a starter';
  String _chosenValue = '';

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
                padding: EdgeInsets.only(top: 140.h - 54.h),
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
                        Row(
                          children: [
                            Gap(80.w),
                            Text(
                              'Starter',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: AppColor.white),
                            ),
                            Gap(15.w),
                            SizedBox(
                              width: 220,
                              height: 40,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  hintText: 'Choose your starter meal',
                                  hintStyle: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(20.h),

                        Row(
                          children: [
                            Gap(80.w),
                            Text(
                              'Main',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: AppColor.white),
                            ),
                            Gap(31.w),
                            SizedBox(
                              width: 220,
                              height: 40,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    hintText: 'Choose your main meal',
                                    hintStyle: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.white)),
                              ),
                            ),
                          ],
                        ),
                        // DropdownButton<String>(
                        //     borderRadius: BorderRadius.circular(20),
                        //     dropdownColor: AppColor.black,
                        //     elevation: 5,
                        //     style: const TextStyle(
                        //         decoration: TextDecoration.overline),
                        //     items: <String>['JJJJJ', 'B', 'C', 'D']
                        //         .map((String value) {
                        //       return DropdownMenuItem<String>(
                        //         value: value,
                        //         child: Text(value),
                        //       );
                        //     }).toList(),
                        //     onChanged: (String? newValue) {
                        //       setState(() {
                        //         _selectedStarter = newValue!;
                        //       });
                        //     }),
                        Gap(30.h),

                        Row(
                          children: [
                            Gap(80.w),
                            Text(
                              'Dessert',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: AppColor.white),
                            ),
                            Gap(12.w),
                            SizedBox(
                              width: 218,
                              height: 40,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    hintText: 'Choose your dessert',
                                    hintStyle: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.white)),
                              ),
                            ),
                          ],
                        ),
                        // Text(
                        //   "Main Course",
                        //   style: GoogleFonts.inter(
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 16.sp,
                        //       color: AppColor.white),
                        // ),
                        // DropdownButton(items: null, onChanged: null),
                        // Gap(30.h),
                        // Text(
                        //   "Dessert",
                        //   style: GoogleFonts.inter(
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 16.sp,
                        //       color: AppColor.white),
                        // ),
                        // DropdownButton(items: null, onChanged: null)
                      ],
                    ),
                    Gap(55.h),
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
