import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_pos_app/providers/app_provider.dart';
import 'package:restaurant_pos_app/providers/order_provider.dart';

import '../../config/colors.dart';
import '../../config/images.dart';

class FoodWidget extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final int id;

  const FoodWidget(this.title, this.description, this.image, this.id,
      {super.key});

  @override
  State<FoodWidget> createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!state) {
          Provider.of<AppProvider>(context, listen: false)
              .addAppCart(id: (widget.id).toString());
        } else {
          Provider.of<AppProvider>(context, listen: false)
              .removeAppCart(id: (widget.id).toString());
        }

        state = !state;
        setState(() {});
      },
      child: Opacity(
        opacity: Provider.of<AppProvider>(context)
                .getAppCart()
                .contains((widget.id).toString())
            ? 1
            : 0.5,
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
              !Provider.of<AppProvider>(context)
                      .getAppCart()
                      .contains((widget.id).toString())
                  ? Image.asset(
                      AppImages.add,
                      width: 30.w,
                      height: 30.w,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      AppImages.added,
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

class FoodWidget1 extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final int id;
  final String category;
  final callback;

  const FoodWidget1(this.title, this.description, this.image, this.id,
      this.category, this.callback,
      {super.key});

  @override
  State<FoodWidget1> createState() => _FoodWidget1State();
}

class _FoodWidget1State extends State<FoodWidget1> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callback,
      child: Opacity(
        opacity: widget.id ==
                Provider.of<OrderProvider>(context, listen: true)
                    .getSelectedFood(widget.category)
            ? 1
            : 0.5,
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
              widget.id !=
                      Provider.of<OrderProvider>(context, listen: true)
                          .getSelectedFood(widget.category)
                  ? Image.asset(
                      AppImages.add,
                      width: 30.w,
                      height: 30.w,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      AppImages.added,
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
