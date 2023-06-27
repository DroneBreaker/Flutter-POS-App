import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colors.dart';
import '../../config/images.dart';

class FoodWidget extends StatefulWidget {
  final title;
  final description;
  final image;
  const FoodWidget(this.title, this.description, this.image, {super.key});

  @override
  State<FoodWidget> createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
      },
      child: Opacity(
        opacity: 1,
        child: Container(
          color: AppColor.white,
          padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 11.w),
          width: double.infinity,
          height: 77.h,
          child: Row(
            children: [
              Image.asset(
                widget.image,
                width: 69.w,
                height: 55.h,
                fit: BoxFit.cover,
              ),
              Gap(12.w),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            color: AppColor.black),
                      ),
                      Gap(5.h),
                      Text(
                        widget.description,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            color: AppColor.textBlack),
                      ),
                    ]),
              ),
              Gap(50.w),
              Image.asset(
                AppImages.breakfast_icon,
                width: 30.w,
                height: 30.w,
                fit: BoxFit.cover,
              ),
              Gap(10.w),
            ],
          ),
        ),
      ),
    );
  }
}
